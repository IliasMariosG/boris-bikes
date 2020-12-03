# Boris Bikes

Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

To help structure your work, here are 22 challenges. They all build on one another. They require you to research things, to get stuck, and to find your own solutions. This is on purpose. A developer is a 'knowledge worker' - someone who will spend the majority of their time researching and learning how to solve problems. It'll suck for a bit, but with practice, you will get faster: and there's no better feeling than finding the answer to a problem that's been standing in your way for hours.

## User Stories

```text
1
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

2
As a person,
So that I can use a good bike,
I'd like to see if a bike is working

3
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```

### Objects and Messages Interaction

1
|Object|Message|
|------|-------|
|person|       |
|bike|         |
|docking_station| releases_a_bike|

2
|Object|Message|
|------|-------|
|person|       |
|bike|is_bike_working?|

3
|Object|Message|
|------|-------|
|member_of_public|       |
|bike|hire_a_bike|
|docking_station |(return) dock_a_bike |

### Diagram

![diagram-bike-docking-station](https://user-images.githubusercontent.com/57366310/100643728-1b5f7c00-3343-11eb-8572-c2d8a3645375.png)
