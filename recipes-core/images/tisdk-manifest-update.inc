# This overrides the same funnction from the tisdk-bundle.bbclass from meta-arago-distro
# This is done to fix the generated sw_manifest text file to always have 7 columns as is the expactation
# There was a bug with License parsing that added extra '|' characters to the line, 
# so parse and replace these with 'or' here.

# This function expects to be passed the following parameter
#   - The location to the opkg info directory containing the control files
#     of the installed packages
# Optionally if the second parameter is set to true then only GPL-3.0 contents
# will be listed.  This is for TI SW Manifests where GPL-3.0 content is
# highlighted as a separate table.
generate_sw_manifest_table() {
    control_dir="$1"
    gplv3_only="$2"

    # Call this here so that the function gets added to the task script
    get_sources_from_recipe

    if [ ! -d "$control_dir" ]
    then
        echo "Could not find the control directory ($control_dir)"
        return 1
    fi

    if [ "$gplv3_only" = "" ]
    then
        # The second parameter was not passed so set to false
        gplv3_only="false"
    fi

echo "
<table border=1 cellspacing=1 cellpadding=1 width=80%>
<tr bgcolor=#c0c0c0  color=white>
    <td><b>Software Name</b></td>
    <td><b>Version</b></td>
    <td><b>License</b></td>
    <td><b>Location</b></td>
    <td><b>Delivered As</b></td>
    <td><b>Modified by TI</b></td>
    <td><b>Obtained from</b></td>
</tr>
" >> ${SW_MANIFEST_FILE}

cat >> ${SW_MANIFEST_TEXT} << EOF
<tbody>
<!-- Software Name
| Version
| License Type
| Delivered As
| Modified by TI
| Location
| Obtained from -->

EOF

    control_files_there=0
    for possible_control_file in $control_dir/*.control
    do
        if [ -f $possible_control_file ]
        then
            control_files_there=1
            break
        fi
    done

    if [ $control_files_there -eq 0 ]
    then
        for pkg_idx in $control_dir/oe*; do
            package_start=`grep -n "^Package" $pkg_idx || true`

            IFS_OLD=${IFS}
            IFS="
"

            begin=""
            end=""
            for pkg in ${package_start}; do
                end=`echo $pkg | cut -d: -f1`

                if [ -z $begin ]; then
                    pkg_name=`echo $pkg | cut -d: -f3`
                    begin=`echo $pkg | cut -d: -f1`
                    continue
                fi
                cnt=$[$cnt+1]
                head -n $[$end - 1] $pkg_idx | tail -n $[$end - $begin] > ${control_dir}/${pkg_name// /}.control

                pkg_name=`echo $pkg | cut -d: -f3`
                begin=$end
            done
            if [ ! -z $end ]; then
                end=`wc -l $pkg_idx | awk '{ print $1 }'`
                end=$[$end + 1]
                tail -n $[$end - $begin] $pkg_idx > ${control_dir}/${pkg_name// /}.control
            fi

            IFS=${IFS_OLD}
        done
    fi

    for i in $control_dir/*.control
    do
        package="`cat $i | grep Package: | awk {'print $2'}`"
        version="`cat $i | grep Version: | awk {'print $2'} | cut -f1-2 -d-`"
        long_version="`cat $i | grep Version: | awk {'print $2'}`"
        license="`cat $i | grep License: | cut -d: -f2 | sed 's/|/or/g' `"
        architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
        recipe="`cat $i | grep Source: | cut -d ':' -f2-`"
        sources="`get_sources_from_recipe $recipe`"
        location="$package""_""$long_version""_""$architecture"".ipk"

        # Set the highlight color if the license in GPL-3.0.  If this is
        # a GPL-3.0 only table then skip this package.
        case "$license" in
            *GPL-3.0*)
                highlight="bgcolor=yellow" ;;
            *unknown*)
                if [ "$gplv3_only" != "true" ]
                then
                    highlight="bgcolor=yellow"
                else
                    continue
                fi
                ;;
            *)
                if [ "$gplv3_only" != "true" ]
                then
                    highlight=""
                else
                    continue
                fi
                ;;
        esac

        # source variable contains the text to be used in the manifest
        source=""
        # Are there additional files in the package that come from the
        # arago/OE metadata?
        extra_files="0"
        modified="No"
        for s in $sources
        do
            case "$s" in
                file://*)
                    extra_files="1"
                    ;;
                http://install.source.dir.local*)
                    # If we are pulling something from a local file system then
                    # it is not a public modification and this should be marked
                    # as modified.  This should not be the normal case.
                    modified="Yes"
                    ;;
                *)
                    source="$source""<a href=$s>$s</a>";;
            esac
        done

        if [ "$extra_files" = "1" ]
        then
            source="$source"" <br>Files from:<br><a href=https://git.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><br><a href=https://git.yoctoproject.org/meta-ti>https://git.yoctoproject.org/meta-ti</a>"
        fi

        case "$package" in
            task-*)
                continue ;;
            *-source*)
                delivered_as="Source"
                ;;
            *)
                delivered_as="Binary"
                ;;
        esac

echo "
<tr>
    <td>${package} </td>
    <td>${version}</td>
    <td $highlight>${license}</td>
    <td>${location}</td>
    <td>${delivered_as}</td>
    <td>${modified}</td>
    <td>${source}</td>
</tr>
" >> ${SW_MANIFEST_FILE}

cat >> ${SW_MANIFEST_TEXT} << EOF
| ${package} | ${version} | ${license} | ${delivered_as} | ${modified} | ${location} | ${source}
EOF
    done

    echo "</table><br><br>" >> ${SW_MANIFEST_FILE}

cat >> ${SW_MANIFEST_TEXT} << EOF
</tbody>

EOF

}

