# **Rubiks cube solver**
Implementation of Rubiks cube solver in Haskell

## **Representation of a Cube**
We have a defined types data structures: 
- "Cube" - (face, face, face, face, face, face)
    - type which consits of 6 faces
- "Face" - (color, color, color, color, color, color, color, color, color)
    - type which consists of 9 colors
- "Color" - W | R | G | B | Y | O
    - data structure which represents color tile in a face
    - Can be one of 6 possible colors in a Rubik's cube: Red, Green, Blue, Yellow, Orange, White

![Structure](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/structure.png)



## **Moves**

### **u** - clockwise up
![clockwise_UP](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/clockwise_UP.png)
   
### **d** - clockwise down 
![clockwise_DOWN](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/clockwise_DOWN.png)

### **l** - clockwise left
![clockwise_LEFT](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/clockwise_LEFT.png)

### **r** - clockwise_right
![clockwise_RIGHT](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/clockwise_RIGHT.png)

### **f** - clockwise_front
![clockwise_FRONT](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/clockwise_FRONT.png)

### **b** - clockwise_back
![clockwise_BACK](https://github.com/PatrikBacko/Rubiks_cube_solver/blob/master/docs/images/clockwise_BACK.png)

### counter-clockwise moves **{u', d', l', r', f', b'}** are just inverse of clockwise moves 


## **Commands for solving a cube**
- **solveBfs** 
    - solves a given cube using regular bfs algorithm and finds to least moves to solve a cube but it is really slow for cubes which need more than 5 moves to solve
    - returns a list of moves to solve a cube
- **solveHuman** 
    - solves a given cube going by stages and for each stage it uses bfs algorithm with more advanced moves (similar to how humans solve a cube)
    - returns a list of moves to solve a cube
    - much faster than solveBfs but won't find least moves to solve a cube


## **How to use it**
- clone this repository
- open terminal in the root of this repository
- run command `ghci`
- run command `:l src/Main.hs`
- run command `solveBfs cube` or `solveHuman cube` where cube is a cube you want to solve

## **Cubes to try**
### generate your own cube
- **generateCube** - function which takes a list of moves and returns a cube after applying those moves to a solvedCube

### test Cubes
- **solvedCube** - solved cube
- **r1 - r14** - test cubes which need 1 to 14 moves to solve

## **Algorithm**
- **Bfs** - uses regular bfs algorithm to find least moves to solve a cube
<br>
- first, we make a state out of given cube and add it to a queue
- then we pop a state from a queue, check if it is a solved cube:
    - if yes, we end, and return this state. with another function "extractSolution" we extract moves from this state (we can do this, because we move and previos state in each state) 
    - in no we generate all possible states from it by applying all moves which are given to to bfs algoritm
- then we add these states to a set of visited states and to end of a queue
- we repeat this process until we find a state which is solved
<br>