#include "catch.hpp"

#include <iostream>
#include "rotate_image.h"

TEST_CASE("Rotate image", "[rotate]")
{
  cv::Mat1w input(2, 2);
  input(0, 0) = 1;
  input(0, 1) = 2;
  input(1, 0) = 3;
  input(1, 1) = 4;

  cv::Mat1w rotated_ref(2, 2);
  rotated_ref(0, 0) = 3;
  rotated_ref(0, 1) = 1;
  rotated_ref(1, 0) = 4;
  rotated_ref(1, 1) = 2;

  REQUIRE(cv::norm(rotated_ref - rotateImage(input)) < 1e-6);
}
