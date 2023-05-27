
# shape_builder examples

## Getting Started
First, make sure you have installed `shape_builder` package. 
<Br />


## Objective

In these examples, you will learn how to draw different shapes from basic to more advanced ones.


## Layout logics

- [01: Shape layout logics](https://github.com/GIfatahTH/shape_builder/blob/dev/example/lib/ex_001_basic_shapes/ex_01_shape_layout.dart)
   <br /><b> Description: </b>
   Shapes Size is determined following the following logics
    * If the Shape has no child, no `height`, no `width`, and  `shouldExpand` parameter is set to false (the default value), then Shape tries to size as small as possible.
    * If the Shape has no `height`, no `width`, and  `shouldExpand` parameter is set to false, then Shape tries to size as big as possible.
    * If the Shape has child, but no `height`, no `width`, then Shape tries to size so to fit its child.
     * If the Shape has `height` or `width`, then Shape tries take the given `height` or `width` respecting the constraint coming form parent.

- [02: Shape color and gradient](https://github.com/GIfatahTH/shape_builder/blob/dev/example/lib/ex_001_basic_shapes/ex_02_color_and_gradient.dart)
   <br /><b> Description: </b>
   This example demonstrate how to color shapes and how to add gradients.

- [03: Add shadow to a shape](https://github.com/GIfatahTH/shape_builder/blob/dev/example/lib/ex_001_basic_shapes/ex_03_shadow.dart)
   <br /><b> Description: </b>
   This example demonstrate how to add shaw to shapes.

- [04: Child to Shape alignment](https://github.com/GIfatahTH/shape_builder/blob/dev/example/lib/ex_001_basic_shapes/ex_04_child_alignment.dart)
   <br /><b> Description: </b>
   This example demonstrate the logic of alignment of the child to the Shape.

- [05: Use shapes as clipper](https://github.com/GIfatahTH/shape_builder/blob/dev/example/lib/ex_001_basic_shapes/ex_05_clip_behaviour.dart)
   <br /><b> Description: </b>
   This example demonstrate to use Shapes to clip widgets.

- [06: Use shapes to clipper images](https://github.com/GIfatahTH/shape_builder/blob/dev/example/lib/ex_001_basic_shapes/ex_06_clip_behaviour_image.dart)
   <br /><b> Description: </b>
   This example demonstrate to use Shapes to clip images.



## Questions & Suggestions
Please feel free to post an issue or PR. As always, your feedback makes this library become better and better.

