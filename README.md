# Definitely lit
## _The quickest way to lit up your 3D scene in Defold!_

Definitly lit is a project contaning examples on how to do a simple and fast lighting system. By default, your mesh can support up to 8 lights AND normal mapping.

## Applying light to your scene

- Obviously, you need to have a scene with 3D meshes.
- You will need to every mesh in your scene to have the mesh you want to be lit named as "lit_model" on your scene.
- Apply the `light_reciever` material to your mesh and the `light_reciever.script` to the game object that holds the mesh to be lit.
- Add a `lamp.go` to your scene, this is a light source that will emit light in all directions. In its script, the `Lit` option should be tweaked and you can also choose the color of the light.
- You don't need to draw the material in the render script, as it is already tagged as "model".

## Applying light to your texture (normal mapping)
- Apply the material `normal_mapping` to your mesh.
- Your mesh must be called `lit_model`. Other rules that you have to follow in applying regular lighting also are the same as in here.

## Observations:
- Only 8 light sources are supported by the system. You can make it support more (or less) by going to the fragment and vertex shader and altering their LIGHT_COUNT macro
- Cel shading is possible, tho it is not robust enough
- This lighting system is just a prototype, and is definitily not finished

Big thanks to my buddies at Defold Discord server!
