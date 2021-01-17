HDR Image GRADient based Evaluator (HIGRADE) Software release.
========================================================================

-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------ 
Copyright (c) 2016 The University of Texas at Austin 
All rights reserved. 

Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, modify, and distribute this database (the images, the results and the source files) and its documentation for any purpose, provided that the copyright notice in its entirity appear in all copies of this database, and the original source of this database, Embedded Signal Processing Laboratory (ESPL, http://www.signal.ece.utexas.edu ) and Laboratory for Image & Video Engineering (LIVE, http://www.live.ece.utexas.edu ) at the University of Texas at Austin (UT Austin, http://www.utexas.edu ), is acknowledged in any publication that reports research using this database.

The following papers are to be cited in the bibliography whenever the database is used as:

1. D. Kundu, D. Ghadiyaram, A. C. Bovik and B. L. Evans, "No-Reference Quality Assessment of High Dynamic Range Pictures," IEEE Transactions on Image Processing, submitted.,June 2016, http://users.ece.utexas.edu/~bevans/papers/2017/crowdsourced/index.html.
2. D. Kundu, D. Ghadiyaram, A. C. Bovik and B. L. Evans, "Large-scale Crowdsourced Study for High Dynamic Range Images," IEEE Transactions on Image Processing, submitted.,May 2016, http://users.ece.utexas.edu/~bevans/papers/2017/crowdsourced/index.html.
3. D. Kundu, D Ghadiyaram, A. C. Bovik, and B. L. Evans, "ESPL-LIVE HDR Image Quality Database," Online: http://signal.ece.utexas.edu/~debarati/HDRDatabase.zip, May 2016.

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------

Investigators

The investigators in this research are:

Debarati Kundu ( debarati@utexas.edu ) -- Graduate student, Dept. of ECE, UT Austin.
Deepti Ghadiyaram ( deeptigp9@gmail.com ) -- Graduate student, Dept. of CS, UT Austin.
Dr. Alan C. Bovik ( bovik@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
Dr. Brian L. Evans ( bevans@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin

Kindly report any suggestions or corrections to Debarati Kundu (debarati@utexas.edu)

========================================================================

This is a demonstration of the HDR Image GRADient based Evaluator (HIGRADE) index.
The algorithm is described in:

D. Kundu, D. Ghadiyaram, A. C. Bovik and B. L. Evans, "No-Reference Quality Assessment of High Dynamic Range Pictue," IEEE Transactions on Image Processing, submitted.,June 2016, http://users.ece.utexas.edu/~bevans/papers/2017/crowdsourced/index.html.

You can change this program as you like and use it anywhere, but please refer to its original source (cite our paper and our web page at http://users.ece.utexas.edu/~bevans/papers/2017/crowdsourced/index.html).

========================================================================

Running on Matlab 

Input : A test image loaded in an array
Output: A quality score of the image.
'higrade_example.m' shows how to run the program. Please read the comments in all the provided MATLAB files for more information.

Dependencies: 

Binaries: svm-predict, svm-scale (from LibSVM: https://www.csie.ntu.edu.tw/~cjlin/libsvm/) - provided with release
MATLAB files: (provided with release)
higrade_example.m
higrade_1.m
higrade_2.m
higrade_spatial.m
imgradient.m
higrade_grad_coherency.m	
higrade_grad_log.m
grad_coherence.m
nakafit.m
gaussian_para_esti.m				

Data files: hdrRange_higrade_1, hdrRange_higrade_2, hdrScaled_higrade_1.txt.model, hdrScaled_higrade_2.txt.model (provided with release)
Image File: H_Exploratorium_2_surreal.PNG (provided with release)
Libraries: Structure Tensor library (http://www.mathworks.com/matlabcentral/fileexchange/12362-structure-tensor-introduction-and-tutorial) (provided with release) 

This code will has been tested on MacOS. For Linux and Windows system, please download the corresponding binaries from the LIBSVM website.

========================================================================

Note on training: 
This release version of HIGRADE was trained on the entire ESPL-LIVE HDR Image Quality database.

This program uses LibSVM binaries.
Below is the requried copyright notice for the LIBSVM binaries distributed with this release.

====================================================================
LibSVM tools: svm-predict, svm-scale (binaries)
--------------------------------------------------------------------

Copyright (c) 2000-2009 Chih-Chung Chang and Chih-Jen Lin
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

3. Neither name of copyright holders nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.


THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
====================================================================