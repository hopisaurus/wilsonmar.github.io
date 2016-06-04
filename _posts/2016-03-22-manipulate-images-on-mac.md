---
layout: post
title: "Crop (Mask) images"
excerpt: "Get just the right 1900x500 picture for your Jekyll website"
tags: [JavaScript, Load Testing, LoadRunner]
image:
# feature: pic deer in forest 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622052/95b08428-0584-11e6-9679-28430c295cf3.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

## Photo editing programs #

Adobe Photoshop 
is the choice of professionals, and premium features means money.
Add a lot of training if you're not into frustration.

Windows machines come with Paint (in)


## Sketch on Mac OSX

I have adopted Sketch on my Mac.

The theme that I am using makes use of 1900x500 photos.

Here's how I've learned to make images of that size.

## Search

The easiest thing is to avoid cropping altogether by finding

Search in images.google.com for "1900x500".

## Crop

1. Open the image file.

0. Click the **Scale** button and specify one of the dimensions (Width 1900 or Height 500, not both).

   Create a mask area:

0. Click the **Insert** icon at the upper-left corner.

0. Select Shape | Rectangle.

0. On the screen drag a small rectangle. Don't worry about the size because it's too difficult to come up
   up with a precise box with the mouse.

0. Specify the Size: type in width: 1900 and height: 500.

   This needs to be done with the aspect ratio lock off (the default).

0. Drag the mask area onto the picture.

   PROTIP: The <a target="_blank" href="https://en.wikipedia.org/wiki/Golden_ratio">
   Golden Ratio</a> is for the subject of the canvas to be 0.618 from the edge.

   * 1900 * .618 = 1174 + 726
   * 500 * .618 = 309 + 191

0. At the left, select both the Rectangle and the picture: hold down the shift key and click.

0. Click the **Mask** icon.

## Export image #

0. Click menu File \| Export. Select Export Selection.

0. Select the Format (JPG) at the lower right.

0. Click Export Slice 1.

0. Specify the file name and folder name.

0. Copy the file name to the clipboard so you put a reference to it somewhere.

## Resources

<iframe width="560" height="315" src="https://www.youtube.com/embed/MqXRVzGyvWU" frameborder="0" allowfullscreen></iframe>
<hr />

