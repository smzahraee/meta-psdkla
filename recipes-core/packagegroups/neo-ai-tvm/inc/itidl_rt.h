/*
*
* Copyright (c) {2015 - 2020} Texas Instruments Incorporated
*
* All rights reserved not granted herein.
*
* Limited License.
*
* Texas Instruments Incorporated grants a world-wide, royalty-free, non-exclusive
* license under copyrights and patents it now or hereafter owns or controls to make,
* have made, use, import, offer to sell and sell ("Utilize") this software subject to the
* terms herein.  With respect to the foregoing patent license, such license is granted
* solely to the extent that any such patent is necessary to Utilize the software alone.
* The patent license shall not apply to any combinations which include this software,
* other than combinations with devices manufactured by or for TI ("TI Devices").
* No hardware patent is licensed hereunder.
*
* Redistributions must preserve existing copyright notices and reproduce this license
* (including the above copyright notice and the disclaimer and (if applicable) source
* code license limitations below) in the documentation and/or other materials provided
* with the distribution
*
* Redistribution and use in binary form, without modification, are permitted provided
* that the following conditions are met:
*
* *       No reverse engineering, decompilation, or disassembly of this software is
* permitted with respect to any software provided in binary form.
*
* *       any redistribution and use are licensed by TI for use only with TI Devices.
*
* *       Nothing shall obligate TI to provide you with source code for the software
* licensed and provided to you in object code.
*
* If software source code is provided to you, modification and redistribution of the
* source code are permitted provided that the following conditions are met:
*
* *       any redistribution and use of the source code, including any resulting derivative
* works, are licensed by TI for use only with TI Devices.
*
* *       any redistribution and use of any object code compiled from the source code
* and any resulting derivative works, are licensed by TI for use only with TI Devices.
*
* Neither the name of Texas Instruments Incorporated nor the names of its suppliers
*
* may be used to endorse or promote products derived from this software without
* specific prior written permission.
*
* DISCLAIMER.
*
* THIS SOFTWARE IS PROVIDED BY TI AND TI'S LICENSORS "AS IS" AND ANY EXPRESS
* OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
* OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL TI AND TI'S LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT,
* INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
* OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*
*/


/**
@file      itidl_rt.h
@brief     This file defines the public interface for TIDL Runtime API 
           This same API supports a client on a different CPU, 
           out-of-process on the same CPU, or in-process
@version 0.1 June 2020 : Initial Code

*/

/** @ingroup    iTI_DL_RT */
/*@{*/
#ifndef ITIDL_RT_H_
#define ITIDL_RT_H_

#include <stdint.h>
#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

#define TIDLRT_STRING_SIZE        ((int32_t) 512)
#define TIDLRT_PAD_DIM_MAX        ((uint32_t) 4)

/**
 *  \anchor eTIDLRT_ElementType
 *  \name   TIDL Element Type
 *
 *  This group defines the different types of element type used by TIDL library
 *
 *  @{
 */
#define TIDLRT_Uint8           ((int32_t) 0)
#define TIDLRT_Int8            ((int32_t) 1)
#define TIDLRT_Uint16          ((int32_t) 2)
#define TIDLRT_Int16           ((int32_t) 3)
#define TIDLRT_Uint32          ((int32_t) 4)
#define TIDLRT_Int32           ((int32_t) 5)
#define TIDLRT_Float32         ((int32_t) 6)
/* @} */


/**
 *  \anchor eTIDLRT_DataDimIndex
 *  \name   TIDL Data Dimension Index
 *
 *  This group defines the indices of dimension array of layer data buffer in TIDL library
 *
 *  @{
 */
#define TIDLRT_DIM_BATCH             ((int32_t) 0)
#define TIDLRT_DIM_NUMCH             ((int32_t) 1)
#define TIDLRT_DIM_HEIGHT            ((int32_t) 2)
#define TIDLRT_DIM_WIDTH             ((int32_t) 3)
#define TIDLRT_DIM_MAX               (TIDLRT_DIM_WIDTH+1)
/* @} */

/**
 *  \anchor eTIDLRT_PitchDimIndex
 *  \name   TIDL Pitch Dimension Index
 *
 *  This group defines the indices of pitch array of layer data buffer in TIDL library
 *
 *  @{
 */
#define TIDLRT_ROI_PITCH             ((uint32_t) 0)
#define TIDLRT_CHANNEL_PITCH         ((uint32_t) 1)
#define TIDLRT_LINE_PITCH            ((uint32_t) 2)
#define TIDLRT_PITCH_MAX             ((uint32_t) (TIDLRT_DIM_MAX - 1))
/* @} */


/**
 *  \anchor eTIDLRT_MemType
 *  \name   Memory types in TIDL RT
 *
 *  Memory types defintion used in the context of TIDL RT
 *
 *  @{
 */
#define TIDLRT_MEM_USER_SPACE        ((uint32_t) 0)
#define TIDLRT_MEM_SHARED            ((uint32_t) 1)
#define TIDLRT_MEM_NATIVE            ((uint32_t) 2)
#define TIDLRT_MEM_MAX             (TIDLRT_MEM_NATIVE+1)
/* @} */


/**
 *  \anchor eTIDLRT_TensorLayout
 *  \name   Tenosr Layout Type
 *
 *  This group defines the indices Tenosr Layout Type suported by TIDL RT library
 *
 *  @{
 */
#define TIDLRT_LT_NCHW             ((uint32_t) 0)
#define TIDLRT_LT_NHWC             ((uint32_t) 1)
#define TIDLRT_LT_MAX               (TIDLRT_LT_NHWC+1)
/* @} */

typedef struct {
/** Unique name for the tensor holding feature vector ,
 * When we have multiple tensors as inputs, the tensors in the imported model and 
 * runtime may not be in same order. This name be part Model IO buF descriptor 
 * file. This name would help in associating each tensor to model input */
int8_t name[TIDLRT_STRING_SIZE];
/** Element type of the feature vector as defined in \ref eTIDLRT_ElementType*/
int32_t elementType;
/** Number of dimensions supported by the tensor */
int32_t numDim;
/** Values of dimensions as defined by \ref eTIDLRT_DataDimIndex*/
int32_t dimValues[TIDLRT_DIM_MAX];
/** Pitch for each dimension as defined by \ref eTIDL_PitchDimIndex*/
int32_t pitch[TIDLRT_DIM_MAX-1];
/** Padding available in Spatial Dimension Left, right, top, Bot*/
int32_t padValues[TIDLRT_PAD_DIM_MAX];
/** Pointer to the buffer Base address*/
void * ptr;
/** Actual tensor data start offset in elements from the base address – Excluding the padding */
int32_t dataOffset;
/** Layout of the data NCHW or NHWC define in \ref eTIDLRT_TensorLayout*/
uint32_t layout;
/** Zero point for Asymmetric Fixed point Representation */
int32_t zeroPoint;
/** Scale used for float to fixed point conversion*/
float scale;
/** memory type – Linux user space memory or Shared memory define in \ref eTIDLRT_MemType*/
uint32_t memType;
}sTIDLRT_Tensor_t;

typedef struct {
    uint64_t cpIn_time_start;
    uint64_t cpIn_time_end;
    uint64_t proc_time_start;
    uint64_t proc_time_end;
    uint64_t cpOut_time_start;
    uint64_t cpOut_time_end;
} sTIDLRT_PerfStats_t;

typedef struct {
/** Pointer to TIDL net structure*/
void * netPtr;
/** Pointer to the Input and Output tesnors descriptor*/
void * ioBufDescPtr;
/** Variable to store network size*/
int32_t net_capacity; //PC-- added. Size of network file
/** Variable to store io params size*/
int32_t io_capacity; //PC-- added. Size of config file
/** Flags to control the data flow for current execution*/
int32_t flowCtrl;
/** Flags to control debugTrace Level*/
int32_t traceLogLevel;
  /** Level for debug trace dumps of intermediate tensors and other data buffers into file */
int32_t traceWriteLevel;
/**  trace files base Name */
void * traceBaseName;
/** Expansion factor used for range of activation while quantization */
float quantRangeExpansionFactor;
/** Update factor used for range of activation while quantization */
float quantRangeUpdateFactor;
/** Call back Function pointer to Write Log*/
int32_t(*TIDLVprintf)(const char * format, va_list arg);
/** Call back Function pointer to Write Binary data to a file*/
int32_t(*TIDLWriteBinToFile)(const char * fileName, void * addr, int32_t size);
/** Call back Function pointer to read data from a binary file */
int32_t(*TIDLReadBinFromFile)(const char * fileName, void * addr, int32_t size);
/** Pointer to structure holding perf data */
sTIDLRT_PerfStats_t *stats;

}sTIDLRT_Params_t;

int32_t TIDLRT_create(sTIDLRT_Params_t *prms, void **handle);

int32_t TIDLRT_delete(void *handle);

int32_t TIDLRT_invoke(void *handle, sTIDLRT_Tensor_t *in[], sTIDLRT_Tensor_t *out[]);

/* Activate will be done by the invoke if the hanlde is not active. */
int32_t TIDLRT_deactivate(void *handle);


int32_t TIDLRT_setParamsDefault(sTIDLRT_Params_t *prms);
int32_t TIDLRT_setTensorDefault(sTIDLRT_Tensor_t *tensor);
int32_t TIDLRT_getDdrStats(uint64_t *read_bytes, uint64_t *write_bytes);

#ifdef __cplusplus
}
#endif

/*@}*/
/* iTI_DL_RT */

#endif /*ITIDL_RT_H_ */

