# kiwijam19

## Heading 
Hi Im josh im learning this thing.

## Theme
Chain Reaction

## Overview
Top down game where you have the ability to spread your infection, then those infected can further spread your disease. At the beginning you are very bad at spreading it. As you level up or gain points you can upgrade certain things to make this easier.

## Core Mechanics

- 2D top down view

- Spreading a disease / infection via AOE

- People infected can spread it too

- Scoring at the end of each round based on number infected

- Scoring also based on rank of person infectd

- Goal to get the whole school sick

- People that dont "die" stay sick but don't do anything to further spread the disease.

## Style

- For each type of sick have seperate colour 1. Sick and able to spread 2. Simply sick but not contagious 3. "Dead / resting" 

## Base Scenes

The player that spreads diseases at the beginning and can move with the users input.
```
Player
{
    sneeze: BaseSneeze // The sneeze that the user can perform.
}
```

All autonomous characters will stemp from this. The key is that they can be infected.
```
NPC
{
    disease: Disease
}
```

The specific disease and the attributes that change its specific impact on the people that carry it.
```
Disease
{
    deadly: boolean
    contagious_length: float
    sneeze: Sneeze // The sneeze that would be produced from an individual with this disease
}
```
```
Sneeze
{
    angle: float // Angle over which this sneeze will project.
    distance: float // How far the sneeze will project from its origin point.
    modifiers: array of SneezeModifier
    sneezes_possible: int // How many times can a person with this disease 
    sneeze
    sneeze_delay: float // How much delay between sneezes at minimum
}
```
An addon that is bought from a shop that can interact with the base sneeze to change its attributes
```
SneezeModifier
{
    
}

```
