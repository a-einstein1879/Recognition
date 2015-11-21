#include "opencvmex.hpp"

using namespace cv;

///////////////////////////////////////////////////////////////////////////
// Check inputs
///////////////////////////////////////////////////////////////////////////
void checkInputs(int nrhs, const mxArray *prhs[])
{    
    const int * tdims;
        
    // Check number of inputs
    if (nrhs != 1)
    {
        mexErrMsgTxt("Incorrect number of inputs. Function expects 1 input.");
    }
    
    // Check input dimensions
    tdims = mxGetDimensions(prhs[0]);
    
    if (mxGetNumberOfDimensions(prhs[0])>2)
    {
        mexErrMsgTxt("Incorrect number of dimensions. Input must be a matrix.");
    }
    
	// Check image data type
    if (!mxIsUint8(prhs[0]))
    {
        mexErrMsgTxt("Image must be UINT8.");
    }
}

///////////////////////////////////////////////////////////////////////////
// Main entry point to a MEX function
///////////////////////////////////////////////////////////////////////////
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{  
	// Check inputs to mex function
    checkInputs(nrhs, prhs);
        
    Mat src;
    ocvMxArrayToImage_uint8(prhs[0], src);
    
    Mat dst;
    dst.create(src.size(), src.type());
    
    int edgeThresh = 1;
    int lowThreshold = 100;
    int ratio = 3;
    int kernel_size = 3;

    Canny(src, dst, lowThreshold, lowThreshold * ratio, kernel_size);
    
    // Put the data back into the output MATLAB array
    plhs[0] = ocvMxArrayFromImage_single(dst);
}

