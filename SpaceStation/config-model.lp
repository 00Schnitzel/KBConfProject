% Test Case Space Station
% Model : 4

%Classes
ooasp_class("4","Object").
ooasp_class("4","SpaceStation").
ooasp_class("4","Astronaut").



%Subclasses
ooasp_subclass("4","SpaceStation","Object").
ooasp_subclass("4","Astronaut","Object").


%Associations

%SpaceStationInhabitants
ooasp_assoc("4","SpaceStationInhabitants","SpaceStation",1,1,"Astronaut",1,5).
