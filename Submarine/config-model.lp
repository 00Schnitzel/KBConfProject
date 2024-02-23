% Test Case Submarine
% Model : 2

%Classes
ooasp_class("2","Object").
ooasp_class("2","Submarine").
ooasp_class("2","Captain").
ooasp_class("2","Crew"). 
ooasp_class("2","Navigator").
ooasp_class("2","Helmsmen").
ooasp_class("2","Cook"). 
ooasp_class("2","WeaponOfficer").
ooasp_class("2","CrewMen"). 


%Subclasses
ooasp_subclass("2","Submarine","Object").
ooasp_subclass("2","Captain","Object").
ooasp_subclass("2","Crew","Object").
ooasp_subclass("2","Navigator","Object").
ooasp_subclass("2","Helmsmen","Object").
ooasp_subclass("2","Cook","Object").
ooasp_subclass("2","WeaponOfficer","Object").
ooasp_subclass("2","CrewMen","Object").


%Associations

%Submarine
ooasp_assoc("2","SubmarineCaptain","Submarine",1,1,"Captain",1,1).

%Captain
ooasp_assoc("2","CaptainCrew","Captain",1,1,"Crew",1,1).

%Navigator
ooasp_assoc("2","CrewNavigator","Crew",1,1,"Navigator",1,1).

%Helmsmen
ooasp_assoc("2","CrewHelmsmen","Crew",1,1,"Helmsmen",1,1).

%Cook
ooasp_assoc("2","CrewCook","Crew",1,1,"Cook",1,1).

%WeaponOfficer
ooasp_assoc("2","CrewWeaponOfficer","Crew",1,1,"WeaponOfficer",1,1).

%CrewMen
ooasp_assoc("2","CrewCrewMen","Crew",1,1,"CrewMen",3,3).