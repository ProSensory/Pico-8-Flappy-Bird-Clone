# Pico-8-Flappy-Bird-Clone
Pico-8

This project was made in Pico-8. A fully featured mini-game clone of Flappy Bird. The goal is to achieve super speed by transitioning
between two different dimensions. 

This game features a custom made physics engine.

Why the code does not look clean and why it is the norm for a Pico-8 game? Pico-8 games are known for cluttered unclean code. 
Pico-8 is a fantasy console that simulates retro game consoles from a time where a console had strict limitations. 
Pico-8 primarily achieves this by preventing a user from using to many token keywords in Lua. 
Token Keywords even effect comments in your code as your not allowed to use them without sacrifice.
Pico-8 limits how many files you are allowed to use. Forcing the user to cram code in a file hoping it will fit. 
All files share the same token limit which makes things even more difficult.
Pico-8 also lacks a huge library other than a simple way of drawing sprites. Everything else must be coded out of scratch.
Since the library is lacking you are forced to use tokens and to cram until you cannot cram anymore keyword tokens in your game. 


The custom made physics engine engine includes
1. a particle system. 
2. player, enemy, and environment collisions. 
3. kinematics
4. gravity
5. bounce factor of particles on environment/enemies
