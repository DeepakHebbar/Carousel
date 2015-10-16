// Copyright (c) 2013-2014 Peter Meyers
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//  UICollectionReusableView+PMUtils.h
//  Pods
//
//  Created by Peter Meyers on 11/12/14.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionReusableView (PMUtils)

/**
 *  The default reuse identifier is simply the name of the class. Override this method in a subclass to change the default reuse identifier.
 *
 *  @return The default reuse identifier.
 */
+ (NSString *) defaultReuseIdentifier;

/**
 *  Finds the closest parent view in the view heirarchy that is a collection view. If the reciever is not within the view heirarchy of a collection view, nil is returned.
 */
@property (nonatomic, readonly) UICollectionView *collectionView;

@end