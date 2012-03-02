dissolve:

The dissolve code is the beginning of my attempt to model a
dissolve/erosion process.

The model is exceedingly simple right now, and I will be making 
attempts to make it more sophisticated.

The model is as follows:

The surface is approximated by a series of points. At each point,
there are two pieces of information: the height of the 'liquid', and the
height of the surface. As long as surface > liquid, a dissolve process
will take place. This is a one-d process, modelled by a simple
ODE.

When the liquid height slips below, the dissolve process will cease.


Future:

Expand the 2D case to include a more sophisticated model:
1: Dissolve in 2D, not just 1D
2. Work with the volume of liquid, not the height.
3. Allow the user to define a rainfall function that can create
   new liquid

Expand the 2D case to a 3D surface

Work on the analytical


The goal of this software is to try to explore the dissolve process. 
I was inspired by the limestone islands of the coast of phuket, thailand
They have giant holes in them, created by the dissolve/erosion process.

When I saw them, I got to thinking about the relationship between the shape of the hole, and the dissolve process, length of time. Could you measure the shape of the hole and find out how long this has been going on?

Also, I thought it would be kind of neat if you could solve for a rainfall
function that would allow you to create an arbitrary final surface.

You could then (maybe!) start creating art through erosion, which would be neat. 

It may also have applications in deposition analysis/creating materials, but I don't know that much.

I will also be working on trying to solve the analytical case, but that
is much harder.


Have fun!
