#ifndef IMAGE_ROTATE_SRC_ROTATE_IMAGE_H_
#define IMAGE_ROTATE_SRC_ROTATE_IMAGE_H_

#include <opencv2/core.hpp>

namespace
{
  inline cv::Mat rotateImage(const cv::Mat& input) {
    cv::Mat output;
    cv::rotate(input, output, cv::ROTATE_90_CLOCKWISE);
    return output;
  }
}

#endif// IMAGE_ROTATE_SRC_ROTATE_IMAGE_H_
