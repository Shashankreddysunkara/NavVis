#include <iostream>

#include <opencv2/imgcodecs.hpp>
#include <opencv2/core.hpp>

#include "rotate_image.h"

int main(int argc, const char **argv)
{
  auto constexpr c_usage = "Usage: ImageRotate <input> <output>";

  if (argc < 3) {
    std::cerr << std::string{ "Wrong number of arguments: " }.append(c_usage) << std::endl;
    return 1;
  }

  const std::string input_file{ argv[1] };
  const std::string output_file{ argv[2] };

  std::cout << "Input file  : " << input_file << std::endl;
  std::cout << "Output file : " << output_file << std::endl;

  const cv::Mat input_image = cv::imread(input_file, cv::IMREAD_COLOR);
  const cv::Mat output_image = rotateImage(input_image);

  if (cv::imwrite(output_file, output_image)) {
    return 0;
  } else {
    std::cerr << "Failed to write image to " << output_file << std::endl;
    return 1;
  }
}
