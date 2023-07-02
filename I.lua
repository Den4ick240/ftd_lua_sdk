-- NO INCLUDE
I = {}

-- Writes a message to the log. Log is visible when editing the LUA box and appears in the 'Errors / Log' panel. The last 100 log messages are maintained.
-- Parameters: ~
--   • {message} (string): the message you want to write to the log.
--- @param message string
function I:Log(message) end

-- Clears your log. Pretty harmless!
function I:ClearLogs() end

-- Writes a message to the HUD. HUD messages are visible during normal play and when on the map.
-- Parameters: ~
--   • {message} (string): the message you want to write to the HUD.
--- @param message string
function I:LogToHud(message) end

-- Returns the index of the ship in the fleet. Starts at 0.
-- (int) Position of the ship in the fleet, starting from 0.
I.FleetIndex = nil

-- Returns the current state of the fleet.
-- (FleetInfo) Information about the fleet
--
-- FleetInfo
-- ID:[int] Unique ID of the fleet.
-- Name:[string] Name of the fleet.
-- Flagship: [FriendlyInfo] Information about the flagship of the fleet.
-- Members: [FriendlyInfo[]] A table of information regarding the fleet's members.  MAY CONTAIN NILS!
--
-- FriendlyInfo
-- Valid:[bool] false if the Friendly Info could not be retrieved
-- Rotation:[Quaternion] the rotation of the friendly construct
-- ReferencePosition: [Vector3] the position of the construct (world East Up North frame) from which PositiveSize and Negative size are referenced
-- PositiveSize: [Vector3] the extent of the construct in the right,up,forwards direction relative to ReferencePostion
-- NegativeSize: [Vector3] the extent of the construct in the left,down,back direction relative to ReferencePosition
-- CenterOfMass: [Vector3] the centre of mass of the construct in world East Up North frame
-- Velocity: [Vector3] the velocity of the construct in world East Up North frame
-- UpVector: [Vector3] The up vector in world East Up North frame
-- RightVector: [Vector3] The up vector in world East Up North frame
-- ForwardVector: [Vector3] The forward vector in world East Up North frame
-- HealthFraction: [float] the fraction of health (including turrets etc)
-- SparesFraction: [float] the spares fraction. Returns 1 if no spares storage present
-- AmmoFraction: [float] the ammo fraction. Returns 1 if no ammo storage present
-- FuelFraction: [float] the fuel fraction. Returns 1 if no fuel storage present
-- EnergyFraction: [float] the energy fraction. Returns 1 if no batteries present
-- PowerFraction: [float] the power fraction. Returns 1 if no fuel storage present
-- ElectricPowerFraction: [float] the electric power fraction. Returns 1 if no fuel storage present
-- AxisAlignedBoundingBoxMinimum: [Vector3] the world East Up North minimum extent of the construct
-- AxisAlignedBoundingBoxMaximum: [Vector3] the world East Up North maximum extent of the construct
-- BlueprintName: [string] the name
-- Id: [int] the unique Id of the construct
I.Fleet = nil

-- Used to determine whether the ship is a flagship of a fleet.
-- (bool) Is the craft the fleet flagship?
I.IsFlagship = nil

-- Returns a Lua table containing a list of known resource zones.
-- (ResourceZoneInfo[]) List of ResourceZones
I.ResourceZones = nil

-- Returns information about a ship's available resources.
-- (ResourceInfo) Ship resource data
--
-- ResourceInfo
-- CrystalTotal [float]: Total Crystal resources.
-- CrystalMax [float]: Max Crystal resources.
-- MetalTotal [float]: Total Metal resources.
-- MetalMax [float]: Max Metal resources.
-- NaturalTotal [float]: Total Natural resources.
-- NaturalMax [float]: Max Natural resources.
-- OilTotal [float]: Total Oil resources.
-- OilMax [float]: Max Oil resources.
-- ScrapTotal [float]: Total Scrap resources.
-- ScrapMax [float]: Max Scrap resources.
I.Resources = nil

-- returns the movement mode of the AI mainframe specified by the index
-- Parameters: ~
--   • {index} (int): index of the AI mainframe
-- Return: ~
-- (string) movement mode of the AI mainframe. Possible modes: Off, Manual, Automatic, Fleet
--- @param index number
--- @return string
function I:GetAIMovementMode(index) end

-- returns the firing mode of the AI mainframe specified by the index
-- Parameters: ~
--   • {index} (int): index of the AI mainframe
-- Return: ~
-- (string) firing mode of the AI mainframe. Possible modes: Off, On
--- @param index number
--- @return string
function I:GetAIFiringMode(index) end

-- Will stop the AI from issuing propulsion commands for the next second, after which it will assume control again. This is exactly what happens when the player presses a control key on an AI controlled vehicle.
function I:TellAiThatWeAreTakingControl() end

-- Adds a propulsion request to the specified axis. This is additive to any other requests made to the axis in the same frame and is clamped between -1 and 1
-- Parameters: ~
--   • {type} : Main = 0, Secondary = 1, Tertiary = 2 , Roll = 3, Pitch = 4, Yaw = 5, Forwards = 6, Up = 7, Right = 8, A = 9, B = 10, C = 11, D = 12, E = 13]
--   • {drive} (float): the amount to add to the axis
--- @param type any
--- @param drive number
function I:AddPropulsionRequest(type, drive) end

-- Sets the propulsion request to the specified axis. This overwrites any other requests made to the axis in the same frame and is clamped between -1 and 1
-- Parameters: ~
--   • {type} : Main = 0, Secondary = 1, Tertiary = 2 , Roll = 3, Pitch = 4, Yaw = 5, Forwards = 6, Up = 7, Right = 8, A = 9, B = 10, C = 11, D = 12, E = 13]
--   • {drive} (float): the amount the axis is set to
--- @param type any
--- @param drive number
function I:SetPropulsionRequest(type, drive) end

-- Gets the sum of all requests made to the specified axis in the previous frame or reads the value that the drive is set to if the type is Main, Secondary or Tertiary
-- Parameters: ~
--   • {type} : Main = 0, Secondary = 1, Tertiary = 2 , Roll = 3, Pitch = 4, Yaw = 5, Forwards = 6, Up = 7, Right = 8, A = 9, B = 10, C = 11, D = 12, E = 13]
--- @param type any
function I:GetPropulsionRequest(type) end

-- Requests a stimuli as per the complex controller block.
-- Parameters: ~
--   • {stim} : none = 0,T =1,G =2 ,Y =3,H =4,U =5,J =6,I =7,K =8,O= 9,L =10,up=11,down=12,left=13,right=14
--- @param stim any
function I:RequestComplexControllerStimulus(stim) end

-- Move fortress in any direction. Limited to 1 meter.
-- Parameters: ~
--   • {direction} (Vector3):  Direction to move the fortress in.  Limited to 1 meter.
--- @param direction any
function I:MoveFortress(direction) end

-- Creates or uses an axis with a custom name. Adds a value to the axis. Axes values are limited to between -1 and 1. Axes names are limited to 32 characters.
-- Parameters: ~
--   • {axisName} (string): name of axis to create/use. Limited to 32 characters.
--   • {drive} (float): value to add to the axis on this frame.
--- @param axisName string
--- @param drive number
function I:RequestCustomAxis(axisName,drive) end

-- Returns the value of the named axis that it had the previous frame, or 0 if axis not created yet.
-- Parameters: ~
--   • {axisName} (string): name of axis to get value for.
-- Return: ~
-- The value of the axis as a float. 0 if axis not created yet.
--- @param axisName string
--- @return any
function I:GetCustomAxis(axisName) end

-- The mainframe count of your vehicle is useful for requesting targets
-- Return: ~
-- The number of mainframes on your vehicle.
--- @return any
function I:GetNumberOfMainframes() end

-- The target count is important when calling GetTarget(mainframeIndex, targetIndex).
-- Parameters: ~
--   • {mainframeIndex} : 0 being the first mainframe. Use GetNumberOfMainframes() to find out how many there are.
-- Return: ~
-- The number of targets in this particular mainframe. Returns 0 if such a mainframe does not exist.
--- @param mainframeIndex any
--- @return any
function I:GetNumberOfTargets(mainframeIndex) end

-- The TargetInfo object contains many interesting variables relating to the target. Valid will be false if the target has died but the AI has not yet cleared it.
-- Parameters: ~
--   • {mainframeIndex} : 0 being the first mainframe. Use GetNumberOfMainframes() to find out how many there are.
--   • {targetIndex} : 0 being the first target. If target prioritisation card is in use 0 is the highest priority target.
-- Return: ~
-- A TargetInfo object
--- @param mainframeIndex any
--- @param targetIndex any
--- @return any
function I:GetTargetInfo(mainframeIndex, targetIndex) end

-- The TargetPositionInfo object contains many interesting variables relating to the target. Valid will be false if the target has died but the AI has not yet cleared it.
-- Parameters: ~
--   • {mainframeIndex} : 0 being the first mainframe. Use GetNumberOfMainframes() to find out how many there are.
--   • {targetIndex} : 0 being the first target. If target prioritisation card is in use 0 is the highest priority target.
-- Return: ~
-- A TargetPositionInfo object
--- @param mainframeIndex any
--- @param targetIndex any
--- @return any
function I:GetTargetPositionInfo(mainframeIndex, targetIndex) end

-- The TargetPositionInfo object contains many interesting variables relating to the target.
-- Parameters: ~
--   • {mainframeIndex} (int): 0 being the first mainframe. Use GetNumberOfMainframes() to find out how many there are.
--   • {x} (float): east west in meters.
--   • {y} (float): up down in meters (0 is sea level).
--   • {z} : north south in meters.
-- Return: ~
-- A TargetPositionInfo object for this point in space. Velocity will be 0.
--- @param mainframeIndex number
--- @param x number
--- @param y number
--- @param z any
--- @return any
function I:GetTargetPositionInfoForPosition(mainframeIndex, x,y,z) end

-- Returns altitude of the terrain at a position in the world. Can be overloaded with a single Vector3 rather than x,y,z components.
-- Parameters: ~
--   • {x} (float): game world east west position in meters.
--   • {y} (float): game world vertical (not important)
--   • {z} : game world north south position in meters.
-- Return: ~
-- (float) the terrain altitude in meters where 0 is sea level.
--- @param x number
--- @param y number
--- @param z any
--- @return number
function I:GetTerrainAltitudeForPosition(x,y,z) end

-- Returns altitude of the terrain at a position relative to the construct. Can be overloaded with a single Vector3 rather than x,y,z components.
-- Parameters: ~
--   • {x} (float): right offset from construct position in meters.
--   • {y} (float): up offset from construct position in meters
--   • {z} : forwards offset from construct position in meters.
-- Return: ~
-- (float) the terrain altitude in meters where 0 is sea level.
--- @param x number
--- @param y number
--- @param z any
--- @return number
function I:GetTerrainAltitudeForLocalPosition(x,y,z) end

-- Returns gravity vector for an altitude. gravity.y is the component of interest.
-- Parameters: ~
--   • {alt} (float): altitude (0 is sea level)
-- Return: ~
-- (Vector3) gravity vector
--- @param alt number
--- @return any
function I:GetGravityForAltitude(alt) end

-- Returns time with an arbitrary offset (i.e. the time will seldom be 0).
-- Return: ~
-- (float) the time in seconds.
--- @return number
function I:GetTime() end

-- Returns time since construct spawned in seconds.
-- Return: ~
-- (float) the time in seconds since the construct spawned.
--- @return number
function I:GetTimeSinceSpawn() end

-- Returns time since the instance started in seconds..
-- Return: ~
-- (float) The time since the Instance started in seconds.
--- @return number
function I:GetGameTime() end

-- Get the direction and magnitude of the current wind.
-- Return: ~
-- (Vector3) Vector representing the direction and the magnitude of the wind.
--- @return any
function I:GetWindDirectionAndMagnitude() end

-- Returns the position of the construct. The construct's position is essentially the position of the first ever block placed, or the centre of the starting raft that it was built from.
-- Return: ~
-- (Vector3) The position (Vector3 has members x, y, and z).
--- @return any
function I:GetConstructPosition() end

-- Return the forward pointing vector of the construct
-- Return: ~
-- (Vector3) The forward pointing vector of the construct (it has length 1)
--- @return any
function I:GetConstructForwardVector() end

-- Return the right pointing vector of the construct
-- Return: ~
-- (Vector3) The right pointing vector of the construct (it has length 1)
--- @return any
function I:GetConstructRightVector() end

-- Return the up pointing vector of the construct
-- Return: ~
-- (Vector3) The up pointing vector of the construct (it has length 1)
--- @return any
function I:GetConstructUpVector() end

-- Returns the 'positive' size of the vehicle (right,up,forwards) relative to its origin (GetConstructPosition()). The coordinates are in local space. This minus GetConstructMinDimensions() provides the full size of the vehicle.
-- Return: ~
-- (Vector3) The size of the vehicle right, up and forwards of its origin
--- @return any
function I:GetConstructMaxDimensions() end

-- Returns the 'negative' size of the vehicle (left,down,back) relative to its origin (GetConstructPosition()). The coordinates are in local space.
-- Return: ~
-- (Vector3) The size of the vehicle left, down and back of its origin
--- @return any
function I:GetConstructMinDimensions() end

-- Return the roll angle in degrees
-- Return: ~
-- (float) The roll angle in degrees
--- @return number
function I:GetConstructRoll() end

-- Return the pitch angle in degrees
-- Return: ~
-- (float) The pitch angle in degrees
--- @return number
function I:GetConstructPitch() end

-- Return the yaw angle in degrees
-- Return: ~
-- (float) The yaw angle in degrees
--- @return number
function I:GetConstructYaw() end

-- Returns the position of the construct's centre of mass in the world
-- Return: ~
-- (Vector3) The position (Vector3 has members x, y, and z).
--- @return any
function I:GetConstructCenterOfMass() end

-- Returns the position of the mainframe in the world. Returns Vector3(0,0,0) if no such mainframe exists.
-- Parameters: ~
--   • {mainframeIndex} (int): 0 is the first mainframe.
-- Return: ~
-- (Vector3) The position (Vector3 has members x, y, and z).
--- @param mainframeIndex number
--- @return any
function I:GetAiPosition(mainframeIndex) end

-- Returns the magnitude of your velocity in meters per second.
-- Return: ~
-- (float) magnitude of your velocity in meters per second.
--- @return number
function I:GetVelocityMagnitude() end

-- Returns the magnitude of your velocity in the forwards direction in meters per second. A negative value means you're going predominently backwards.
-- Return: ~
-- (float) magnitude of your forwards velocity in meters per second.
--- @return number
function I:GetForwardsVelocityMagnitude() end

-- Returns your construct's velocity vector in world space in meters per second. x is east west, y is up down and z is north south..
-- Return: ~
-- (Vector3) Your construct's velocity vector in meters per second
--- @return any
function I:GetVelocityVector() end

-- Returns your construct's velocity vector in world space in meters per second. x is east west, y is up down and z is north south. It's normalized to have a length of 1.
-- Return: ~
-- (Vector3) Your construct's velocity vector in meters per second- normalized to have a length of 1.
--- @return any
function I:GetVelocityVectorNormalized() end

-- Returns your angular velocity. x is speed of turn around the east->west axis, y is around the vertical axis and z is around the north south axis. You're probably going to want the next function instead of this one...
-- Return: ~
-- (Vector3) Your construct's angular velocity in world space
--- @return any
function I:GetAngularVelocity() end

-- Returns your angular velocity. x is pitch, y yaw and z roll.
-- Return: ~
-- (Vector3) Your construct's angular velocity in local space
--- @return any
function I:GetLocalAngularVelocity() end

-- Returns the fraction of ammo your construct has left
-- Return: ~
-- (float) fraction. 0 to 1. 1 if no ammo storage is available
--- @return number
function I:GetAmmoFraction() end

-- Returns the fraction of fuel your construct has left
-- Return: ~
-- (float) fraction. 0 to 1. 1 if no fuel storage is available
--- @return number
function I:GetFuelFraction() end

-- Returns the fraction of spares your construct has left
-- Return: ~
-- (float) fraction. 0 to 1. 1 if no spares storage is available
--- @return number
function I:GetSparesFraction() end

-- Returns the fraction of energy your construct has left
-- Return: ~
-- (float) fraction. 0 to 1. 1 if no batteries are available
--- @return number
function I:GetEnergyFraction() end

-- Returns the fraction of power your construct has left
-- Return: ~
-- (float) fraction. 0 to 1
--- @return number
function I:GetPowerFraction() end

-- Returns the fraction of electric power your construct has left
-- Return: ~
-- (float) fraction. 0 to 1.
--- @return number
function I:GetElectricPowerFraction() end

-- Returns the fraction of health your construct has (including turrets etc)
-- Return: ~
-- (float) fraction. 0 to 1. 1 if full health
--- @return number
function I:GetHealthFraction() end

-- Returns true if the vehicle is docked
-- Return: ~
-- (bool) Docked? true for yes.
--- @return boolean
function I:IsDocked() end

-- Returns health difference over a specified measurement time
-- Parameters: ~
--   • {time} (float): the time you want the difference measured over. Time will be limited to be between 1 and 30.
-- Return: ~
-- (float) health difference as a fraction (0 to 1)
--- @param time number
--- @return number
function I:GetHealthFractionDifference(time) end

-- Returns the the name of this blueprint.
-- Return: ~
-- (string) name of the bluepritn.
--- @return string
function I:GetBlueprintName() end

-- Returns the the unique id of this construct. No other construct has the same id.
-- Return: ~
-- (int) the unique id.
--- @return number
function I:GetUniqueId() end

-- Returns the number of components of this type
-- Parameters: ~
--   • {type} (int): the type of component you want the count of.
-- Return: ~
-- (int) the number of components of this type.
--- @param type number
--- @return number
function I:Component_GetCount(type) end

-- Returns the local position in the vehicle of this component.
-- Parameters: ~
--   • {type} (int): the type of component you want the local position of.
--   • {index} (int): the index of the component you want the position of.
-- Return: ~
-- (Vector3i) a Vector3i is a Vector3 where .x .y and .z are integers.
--- @param type number
--- @param index number
--- @return any
function I:Component_GetLocalPosition(type,index) end

-- Returns an extensive BlockInfo object for the component.
-- Parameters: ~
--   • {type} (int): the type of component you want information on.
--   • {index} (int): the index of the component you want block info for..
-- Return: ~
-- (BlockInfo) a BlockInfo structure relating to the component.
--
-- BlockInfo
-- Valid:[bool] false means this BlockInfo packet is useless
-- Position:[Vector3] position in world (east,up,north)
-- LocalPosition:[Vector3] position in construct (right,up,forwards)
-- LocalPositionRelativeToCom:[Vector3] local position relative to the center of mass
-- Forwards:[Vector3] forwards direction in world(east,up,north)
-- LocalForwards:[Vector3] forward direction in construct (right,up,forwards)
-- Rotation:[Quaternion] the rotation of the block in world coordinates
-- LocalRotation:[Quaternion] the rotation of the block in the vehicle's (or turret's) coordinate system.
-- SubConstructIdentifier:[int] the sub construct identifier of the subconstruct the block is part of.
-- CustomName:[string] the custom name assigned to the block
--- @param type number
--- @param index number
--- @return any
function I:Component_GetBlockInfo(type,index) end

-- Returns a boolean (true/false) for a component. Depending on the type of this component this means different things (or nothing at all). Default return is false.
-- Parameters: ~
--   • {type} (int): the type of component you want boolean logic for.
--   • {blockIndex} (int): the index of the component you want boolean logic for.
-- Return: ~
-- (bool) the first boolean logic for this component. For a component without boolean logic, or a block index that doesn't exist, false is returned.
--- @param type number
--- @param blockIndex number
--- @return boolean
function I:Component_GetBoolLogic(type, blockIndex) end

-- Returns a boolean (true/false) for a component. Depending on the type of this component this means different things (or nothing at all). Default return is false.
-- Parameters: ~
--   • {type} (int): the type of component you want boolean logic for.
--   • {blockIndex} (int): the index of the component you want boolean logic for.
--   • {propertyIndex} (int): the index of the index of the boolean logic you want.
-- Return: ~
-- (bool) the specified boolean logic for this component. For a component without boolean logic, or an index that doesn't exist, false is returned.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex number
--- @return boolean
function I:Component_GetBoolLogic_1(type, blockIndex, propertyIndex) end

-- Sets the first boolean logic for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {index} (int): the index of the component you want to set boolean logic for.
--   • {bool} (bool): the true/false you want to set.
--- @param type number
--- @param index number
--- @param bool boolean
function I:Component_SetBoolLogic(type,index,bool) end

-- Sets the specified boolean logic for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {blockIndex} (int): the index of the component you want to set boolean logic for.
--   • {propertyIndex1} (int): the index of the boolean logic you want to set.
--   • {bool1} (bool): the true/false you want to set.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param bool1 boolean
function I:Component_SetBoolLogic_1(type, blockIndex, propertyIndex1, bool1) end

-- Sets the two specified boolean logics for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {blockIndex} (int): the index of the component you want to set boolean logic for.
--   • {propertyIndex1} (int): the index of the first boolean logic you want to set.
--   • {bool1} (bool): the true/false you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second boolean logic you want to set.
--   • {bool2} (bool): the true/false you want to set the second logic to.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param bool1 boolean
--- @param propertyIndex2 number
--- @param bool2 boolean
function I:Component_SetBoolLogic_2(type, blockIndex, propertyIndex1, bool1, propertyIndex2, bool2) end

-- Sets the three specified boolean logics for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {blockIndex} (int): the index of the component you want to set boolean logic for.
--   • {propertyIndex1} (int): the index of the first boolean logic you want to set.
--   • {bool1} (bool): the true/false you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second boolean logic you want to set.
--   • {bool2} (bool): the true/false you want to set the second logic to.
--   • {propertyIndex3} (int): the index of the third boolean logic you want to set.
--   • {bool3} (bool): the true/false you want to set the third logic to.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param bool1 boolean
--- @param propertyIndex2 number
--- @param bool2 boolean
--- @param propertyIndex3 number
--- @param bool3 boolean
function I:Component_SetBoolLogic_3(type, blockIndex, propertyIndex1, bool1, propertyIndex2, bool2, propertyIndex3, bool3) end

-- Returns a floating point value for a component. Depending on the type of this component this means different things (or nothing at all). Default return is 0.
-- Parameters: ~
--   • {type} (int): the type of component you want float logic for.
--   • {blockIndex} (int): the index of the component you want float logic for.
-- Return: ~
-- (float) the first float logic for this component. For a component without float logic, or a block index that doesn't exist, 0 is returned.
--- @param type number
--- @param blockIndex number
--- @return number
function I:Component_GetFloatLogic(type, blockIndex) end

-- Returns a floating point value for a component. Depending on the type of this component this means different things (or nothing at all). Default return is 0.
-- Parameters: ~
--   • {type} (int): the type of component you want float logic for.
--   • {blockIndex} (int): the index of the component you want float logic for.
--   • {propertyIndex} (int): the index of the index of the float logic you want.
-- Return: ~
-- (float) the specified float logic for this component. For a component without float logic, or an index that doesn't exist, 0 is returned.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex number
--- @return number
function I:Component_GetFloatLogic_1(type, blockIndex, propertyIndex) end

-- Sets the first float logic for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {index} (int): the index of the component you want to set float logic for.
--   • {float} (float): the floating point value you want to set.
--- @param type number
--- @param index number
--- @param float number
function I:Component_SetFloatLogic(type,index,float) end

-- Sets the specified float logic for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {blockIndex} (int): the index of the component you want to set float logic for.
--   • {propertyIndex1} (int): the index of the float logic you want to set.
--   • {float1} (float): the floating point value you want to set.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param float1 number
function I:Component_SetFloatLogic_1(type, blockIndex, propertyIndex1, float1) end

-- Sets the two specified float logics for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {blockIndex} (int): the index of the component you want to set float logic for.
--   • {propertyIndex1} (int): the index of the first float logic you want to set.
--   • {float1} (float): the floating point value you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second float logic you want to set.
--   • {float2} (float): the floating point value you want to set the second logic to.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param float1 number
--- @param propertyIndex2 number
--- @param float2 number
function I:Component_SetFloatLogic_2(type, blockIndex, propertyIndex1, float1, propertyIndex2, float2) end

-- Sets the three specified float logics for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {blockIndex} (int): the index of the component you want to set float logic for.
--   • {propertyIndex1} (int): the index of the first float logic you want to set.
--   • {float1} (float): the floating point value you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second float logic you want to set.
--   • {float2} (float): the floating point value you want to set the second logic to.
--   • {propertyIndex3} (int): the index of the third float logic you want to set.
--   • {float3} (float): the floating point value you want to set the third logic to.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param float1 number
--- @param propertyIndex2 number
--- @param float2 number
--- @param propertyIndex3 number
--- @param float3 number
function I:Component_SetFloatLogic_3(type, blockIndex, propertyIndex1, float1, propertyIndex2, float2, propertyIndex3, float3) end

-- Returns a integer number for a component. Depending on the type of this component this means different things (or nothing at all). Default return is 0.
-- Parameters: ~
--   • {type} (int): the type of component you want int logic for.
--   • {blockIndex} (int): the index of the component you want int logic for.
-- Return: ~
-- (int) the first int logic for this component. For a component without int logic, or a block index that doesn't exist, 0 is returned.
--- @param type number
--- @param blockIndex number
--- @return number
function I:Component_GetIntLogic(type, blockIndex) end

-- Returns a integer number for a component. Depending on the type of this component this means different things (or nothing at all). Default return is 0.
-- Parameters: ~
--   • {type} (int): the type of component you want int logic for.
--   • {blockIndex} (int): the index of the component you want int logic for.
--   • {propertyIndex} (int): the index of the index of the int logic you want.
-- Return: ~
-- (int) the specified int logic for this component. For a component without int logic, or an index that doesn't exist, 0 is returned.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex number
--- @return number
function I:Component_GetIntLogic_1(type, blockIndex, propertyIndex) end

-- Sets the first int logic for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {index} (int): the index of the component you want to set int logic for.
--   • {int} (int): the integer number you want to set.
--- @param type number
--- @param index number
--- @param int number
function I:Component_SetIntLogic(type,index,int) end

-- Sets the specified int logic for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {blockIndex} (int): the index of the component you want to set int logic for.
--   • {propertyIndex1} (int): the index of the int logic you want to set.
--   • {int1} (int): the integer number you want to set.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param int1 number
function I:Component_SetIntLogic_1(type, blockIndex, propertyIndex1, int1) end

-- Sets the two specified int logics for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {blockIndex} (int): the index of the component you want to set int logic for.
--   • {propertyIndex1} (int): the index of the first int logic you want to set.
--   • {int1} (int): the integer number you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second int logic you want to set.
--   • {int2} (int): the integer number you want to set the second logic to.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param int1 number
--- @param propertyIndex2 number
--- @param int2 number
function I:Component_SetIntLogic_2(type, blockIndex, propertyIndex1, int1, propertyIndex2, int2) end

-- Sets the three specified int logics for a component. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {blockIndex} (int): the index of the component you want to set int logic for.
--   • {propertyIndex1} (int): the index of the first int logic you want to set.
--   • {int1} (int): the integer number you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second int logic you want to set.
--   • {int2} (int): the integer number you want to set the second logic to.
--   • {propertyIndex3} (int): the index of the third int logic you want to set.
--   • {int3} (int): the integer number you want to set the third logic to.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param int1 number
--- @param propertyIndex2 number
--- @param int2 number
--- @param propertyIndex3 number
--- @param int3 number
function I:Component_SetIntLogic_3(type, blockIndex, propertyIndex1, int1, propertyIndex2, int2, propertyIndex3, int3) end

-- Sets the first boolean logic for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.ool [bool] the bool (true/false) you want to set.
--- @param type number
function I:Component_SetBoolLogicAll(type, bool) end

-- Sets the specified boolean logic for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {blockIndex} (int): the index of the component you want to set boolean logic for.
--   • {propertyIndex1} (int): the index of the boolean logic you want to set.
--   • {bool1} (bool): the true/false you want to set.
--- @param type number
--- @param blockIndex number
--- @param propertyIndex1 number
--- @param bool1 boolean
function I:Component_SetBoolLogicAll_1(type, blockIndex, propertyIndex1, bool1) end

-- Sets the two specified boolean logics for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {propertyIndex1} (int): the index of the first boolean logic you want to set.
--   • {bool1} (bool): the true/false you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second boolean logic you want to set.
--   • {bool2} (bool): the true/false you want to set the second logic to.
--- @param type number
--- @param propertyIndex1 number
--- @param bool1 boolean
--- @param propertyIndex2 number
--- @param bool2 boolean
function I:Component_SetBoolLogicAll_2(type, propertyIndex1, bool1, propertyIndex2, bool2) end

-- Sets the three specified boolean logics for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set boolean logic for.
--   • {propertyIndex1} (int): the index of the first boolean logic you want to set.
--   • {bool1} (bool): the true/false you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second boolean logic you want to set.
--   • {bool2} (bool): the true/false you want to set the second logic to.
--   • {propertyIndex3} (int): the index of the third boolean logic you want to set.
--   • {bool3} (bool): the true/false you want to set the third logic to.
--- @param type number
--- @param propertyIndex1 number
--- @param bool1 boolean
--- @param propertyIndex2 number
--- @param bool2 boolean
--- @param propertyIndex3 number
--- @param bool3 boolean
function I:Component_SetBoolLogicAll_3(type, propertyIndex1, bool1, propertyIndex2, bool2, propertyIndex3, bool3) end

-- Sets the first floating point logic for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set floating point logic for.
--   • {float} (float): the floating point number you want to set.
--- @param type number
--- @param float number
function I:Component_SetFloatLogicAll(type, float) end

-- Sets the specified floating point logic for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {propertyIndex1} (int): the index of the float logic you want to set.
--   • {float1} (float): the floating point value you want to set.
--- @param type number
--- @param propertyIndex1 number
--- @param float1 number
function I:Component_SetFloatLogicAll_1(type, propertyIndex1, float1) end

-- Sets the two specified floating point logics for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {propertyIndex1} (int): the index of the first float logic you want to set.
--   • {float1} (float): the floating point value you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second float logic you want to set.
--   • {float2} (float): the floating point value you want to set the second logic to.
--- @param type number
--- @param propertyIndex1 number
--- @param float1 number
--- @param propertyIndex2 number
--- @param float2 number
function I:Component_SetFloatLogicAll_2(type, propertyIndex1, float1, propertyIndex2, float2) end

-- Sets the three specified floating point logics for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set float logic for.
--   • {propertyIndex1} (int): the index of the first float logic you want to set.
--   • {float1} (float): the floating point value you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second float logic you want to set.
--   • {float2} (float): the floating point value you want to set the second logic to.
--   • {propertyIndex3} (int): the index of the third float logic you want to set.
--   • {float3} (float): the floating point value you want to set the third logic to.
--- @param type number
--- @param propertyIndex1 number
--- @param float1 number
--- @param propertyIndex2 number
--- @param float2 number
--- @param propertyIndex3 number
--- @param float3 number
function I:Component_SetFloatLogicAll_3(type, propertyIndex1, float1, propertyIndex2, float2, propertyIndex3, float3) end

-- Sets the first integer logic for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set integer logic for.
--   • {int} (int): the integer you want to set.
--- @param type number
--- @param int number
function I:Component_SetIntLogicAll(type, int) end

-- Sets the specified integer logic for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {propertyIndex1} (int): the index of the int logic you want to set.
--   • {int1} (int): the integer number you want to set.
--- @param type number
--- @param propertyIndex1 number
--- @param int1 number
function I:Component_SetIntLogicAll_1(type, propertyIndex1, int1) end

-- Sets the two specified integer logics for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {propertyIndex1} (int): the index of the first int logic you want to set.
--   • {int1} (int): the integer number you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second int logic you want to set.
--   • {int2} (int): the integer number you want to set the second logic to.
--- @param type number
--- @param propertyIndex1 number
--- @param int1 number
--- @param propertyIndex2 number
--- @param int2 number
function I:Component_SetIntLogicAll_2(type, propertyIndex1, int1, propertyIndex2, int2) end

-- Sets the three specified integer logics for all components of a specific type. Depending on the type of this component this means different things (or nothing at all).
-- Parameters: ~
--   • {type} (int): the type of component you want to set int logic for.
--   • {propertyIndex1} (int): the index of the first int logic you want to set.
--   • {int1} (int): the integer number you want to set the first logic to.
--   • {propertyIndex2} (int): the index of the second int logic you want to set.
--   • {int2} (int): the integer number you want to set the second logic to.
--   • {propertyIndex3} (int): the index of the third int logic you want to set.
--   • {int3} (int): the integer number you want to set the third logic to.
--- @param type number
--- @param propertyIndex1 number
--- @param int1 number
--- @param propertyIndex2 number
--- @param int2 number
--- @param propertyIndex3 number
--- @param int3 number
function I:Component_SetIntLogicAll_3(type, propertyIndex1, int1, propertyIndex2, int2, propertyIndex3, int3) end

-- Sets the url of the specified hologram projector
-- Parameters: ~
--   • {index} (int): the index of the hologram projector.
--   • {url} (string): the url to set the hologram projector to as a string.
--- @param index number
--- @param url string
function I:SetHologramProjectorURL(index, url) end

-- Sets the url of the specified poster holder
-- Parameters: ~
--   • {index} (int): the index of the poster holder.
--   • {url} (string): the url to set the poster holder to as a string.
--- @param index number
--- @param url string
function I:SetPosterHolderURL(index, url) end

-- Get the number of weapons on the hull. Knowing is number is useful for when you want to call GetWeaponInfo(i) to find out weapon information.
-- Return: ~
-- (int) the number of weapons on the hull- doesn't include weapons on the turrets but does include the turrets themselves.
--- @return number
function I:GetWeaponCount() end

-- Gets weapon information for a specific weapon. Useful to figure out what sort of weapon is present.
-- Parameters: ~
--   • {weaponIndex} (int): the index of the weapon you want information on. 0 is the first weapon.
-- Return: ~
-- (WeaponInfo) information on the weapon. weaponInfo.Valid is false if you ask for an invalid weaponIndex.
--
-- WeaponInfo
-- Valid [bool]: false means this WeaponInfo packet is useless. Move onto the next valid one.
-- LocalPosition [Vector3]: the local position in the vehicle of the weapon. x is right, y is up and z is forwards.
-- GlobalPosition [Vector3]: the global position of the weapon. x is East, y is Up and Z is North.
-- LocalFirePoint [Vector3]: the local position in the vehicle where the projectile or laser will be created.
-- GlobalFirePoint [Vector3]: the global position in the world where the projectile or laser will be created.
-- Speed [float]: the speed in meters per second of the weapon- approximately correct for most weapon types.
-- CurrentDirection [Vector3]: the direction in global coordinate system that the weapon is facing
-- WeaponType [int]: the type of the weapon. cannon = 0,missile = 1 ,laser = 2,harpoon = 3,turret = 4,missilecontrol = 5,fireControlComputer  =6
-- WeaponSlot [int]: the weapon slot of the weapon itself. 0 -> 5.
-- WeaponSlotMask [int]: the weapon slot bit mask. The rightmost bit represents 'ALL' and is always on, and the second bit represents slot 1, etc. (for example 100111 will respond to slots All, 1, 2, and 5)
-- PlayerCurrentlyControllingIt [bool]: true if the player is controlling this weapon at the moment
--- @param weaponIndex number
--- @return any
function I:GetWeaponInfo(weaponIndex) end

-- Gets field-of-fire constrains information for a specific weapon.
-- Parameters: ~
--   • {weaponIndex} (int): the index of the weapon you want the constraints off. 0 is the first weapon.
-- Return: ~
-- (WeaponConsraints) information on the field-of-fire constraints of the weapon.
--- @param weaponIndex number
--- @return any
function I:GetWeaponConstraints(weaponIndex) end

-- Gets the block information for a specific weapon.
-- Parameters: ~
--   • {weaponIndex} (int): the index of the weapon you want information on. 0 is the first weapon.
-- Return: ~
-- (BlockInfo) the block inforamation of the main component of the weapon. See 'Components' for information on BlockInfo.
--
-- BlockInfo
-- Valid:[bool] false means this BlockInfo packet is useless
-- Position:[Vector3] position in world (east,up,north)
-- LocalPosition:[Vector3] position in construct (right,up,forwards)
-- LocalPositionRelativeToCom:[Vector3] local position relative to the center of mass
-- Forwards:[Vector3] forwards direction in world(east,up,north)
-- LocalForwards:[Vector3] forward direction in construct (right,up,forwards)
-- Rotation:[Quaternion] the rotation of the block in world coordinates
-- LocalRotation:[Quaternion] the rotation of the block in the vehicle's (or turret's) coordinate system.
-- SubConstructIdentifier:[int] the sub construct identifier of the subconstruct the block is part of.
-- CustomName:[string] the custom name assigned to the block
--- @param weaponIndex number
--- @return any
function I:GetWeaponBlockInfo(weaponIndex) end

-- Aims a weapon in a specific direction. For a turret this will aim all weapons on the turret as well as the turret itself.
-- Parameters: ~
--   • {weaponIndex} (int): 0 is the first weapon.
--   • {z} (floats): the world coordinate scheme direction components to point in. They don't need to be normalised.
--   • {weaponSlot} (int): 0 for all, otherwise 1 to 5.
-- Return: ~
-- (int) the number of weapons that can fire in this direction. 0 for none.
--- @param weaponIndex number
--- @param z any
--- @param weaponSlot number
--- @return number
function I:AimWeaponInDirection(weaponIndex, x,y,z, weaponSlot) end

-- Fires a specific weapon. It's important for most weapons that you aim them first as they won't fire if they can't fire in the direction they are aimed.
-- Parameters: ~
--   • {weaponIndex} (int): 0 is the first weapon.
--   • {weaponSlot} (int): 0 will control all weapons
-- Return: ~
-- (bool) has any weapon fired? will be true if so.
--- @param weaponIndex number
--- @param weaponSlot number
--- @return boolean
function I:FireWeapon(weaponIndex, weaponSlot) end

-- return the number of weapons on the turret or spinner. If you wanted to control the turret itself then note that it is treated as a hull mounted weapon.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): This identifier never change in the blueprint, use the SubConstructs-related functions to get it.
-- Return: ~
-- (int) the number of weapons on this turret or spinner, not including the turret itself
--- @param SubConstructIdentifier number
--- @return number
function I:GetWeaponCountOnSubConstruct(SubConstructIdentifier) end

-- Get weapon info of a weapon on a turret or spinner
-- Parameters: ~
--   • {SubConstructIdentifier} (int): This identifier never change in the blueprint, use the SubConstructs-related functions to get it.
--   • {weaponIndex} (int): the index of the weapon. 0 is the first one.
-- Return: ~
-- (WeaponInfo) a WeaponInfo object. See above for the definition of this structure. Note that changes to this structure in LUA do not affect the weapon itself.
--
-- WeaponInfo
-- Valid [bool]: false means this WeaponInfo packet is useless. Move onto the next valid one.
-- LocalPosition [Vector3]: the local position in the vehicle of the weapon. x is right, y is up and z is forwards.
-- GlobalPosition [Vector3]: the global position of the weapon. x is East, y is Up and Z is North.
-- LocalFirePoint [Vector3]: the local position in the vehicle where the projectile or laser will be created.
-- GlobalFirePoint [Vector3]: the global position in the world where the projectile or laser will be created.
-- Speed [float]: the speed in meters per second of the weapon- approximately correct for most weapon types.
-- CurrentDirection [Vector3]: the direction in global coordinate system that the weapon is facing
-- WeaponType [int]: the type of the weapon. cannon = 0,missile = 1 ,laser = 2,harpoon = 3,turret = 4,missilecontrol = 5,fireControlComputer  =6
-- WeaponSlot [int]: the weapon slot of the weapon itself. 0 -> 5.
-- WeaponSlotMask [int]: the weapon slot bit mask. The rightmost bit represents 'ALL' and is always on, and the second bit represents slot 1, etc. (for example 100111 will respond to slots All, 1, 2, and 5)
-- PlayerCurrentlyControllingIt [bool]: true if the player is controlling this weapon at the moment
--- @param SubConstructIdentifier number
--- @param weaponIndex number
--- @return any
function I:GetWeaponInfoOnSubConstruct(SubConstructIdentifier, weaponIndex) end

-- Gets field-of-fire constrains information for a specific weapon.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): This identifier never change in the blueprint, use the SubConstructs-related functions to get it.
--   • {weaponIndex} (int): the index of the weapon. 0 is the first one.
-- Return: ~
-- (WeaponConsraints) information on the field-of-fire constraints of the weapon.
--- @param SubConstructIdentifier number
--- @param weaponIndex number
--- @return any
function I:GetWeaponConstraintsOnSubConstruct(SubConstructIdentifier, weaponIndex) end

-- Gets the block information for a specific weapon.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): This identifier never change in the blueprint, use the SubConstructs-related functions to get it.
--   • {weaponIndex} (int): the index of the weapon. 0 is the first one.
-- Return: ~
-- (BlockInfo) the block inforamation of the main component of the weapon. See 'Components' for information on BlockInfo.
--
-- BlockInfo
-- Valid:[bool] false means this BlockInfo packet is useless
-- Position:[Vector3] position in world (east,up,north)
-- LocalPosition:[Vector3] position in construct (right,up,forwards)
-- LocalPositionRelativeToCom:[Vector3] local position relative to the center of mass
-- Forwards:[Vector3] forwards direction in world(east,up,north)
-- LocalForwards:[Vector3] forward direction in construct (right,up,forwards)
-- Rotation:[Quaternion] the rotation of the block in world coordinates
-- LocalRotation:[Quaternion] the rotation of the block in the vehicle's (or turret's) coordinate system.
-- SubConstructIdentifier:[int] the sub construct identifier of the subconstruct the block is part of.
-- CustomName:[string] the custom name assigned to the block
--- @param SubConstructIdentifier number
--- @param weaponIndex number
--- @return any
function I:GetWeaponBlockInfoOnSubConstruct(SubConstructIdentifier, weaponIndex) end

-- Aims a specific weapon on the turret without aiming the turret
-- Parameters: ~
--   • 'SubConstructIdentifier' is the SubConstruct identifier. For the other parameters, see 'AimWeaponInDirection'
-- Return: ~
-- as per AimWeaponInDirection
---
--- @return any
function I:AimWeaponInDirectionOnSubConstruct(SubConstructIdentifier,weaponIndex,x,y,z,weaponSlot) end

-- Fires a specific weapon. It's important for most weapons that you aim them first as they won't fire if they can't fire in the direction they are aimed.
-- Parameters: ~
--   • 'SubConstructIdentifier' is the SubConstruct identifier. For the other parameters, see 'FireWeapon'
-- Return: ~
-- (bool) has any weapon fired? will be true if so.
---
--- @return boolean
function I:FireWeaponOnSubConstruct(SubConstructIdentifier,weaponIndex,weaponSlot) end

-- Return the number of missiles the construct has warnings for
-- Return: ~
-- (int) the number of missiles being warned on
--- @return number
function I:GetNumberOfWarnings() end

-- Request information on a specific missile warning
-- Parameters: ~
--   • {missileIndex} (int): the index of the missile
-- Return: ~
-- (MissileWarningInfo) information on the missile. missileWarningInfo.Valid = false if you didn't request an existing missile index
--
-- MissileWarningInfo
-- Valid: [bool] false if the warning is junk due to incorrect indices.
-- Position: [Vector3] the position of the missile
-- Velocity: [Vector3] the velocity of the missile in meters per second
-- Range : [float] the distance from centre of mass of your construct to the missile
-- Azimuth :[float] the azimuth angle between your construct's forward direction and the missile (degrees)
-- Elevation: [float] the elevation angle between your construct's forward direction and the missile (degrees)
-- TimeSinceLaunch: [float] the time since missile launch.
-- Id: [int] the unique Id of the missile
--- @param missileIndex number
--- @return any
function I:GetMissileWarning(missileIndex) end

-- Return the number of LuaTransceivers. Each transceiver can have a number of missiles which are controllable
-- Return: ~
-- (int) the number of LuaTransceivers
--- @return number
function I:GetLuaTransceiverCount() end

-- Returns the number of missiles which that luaTransceiver has communications link to
-- Parameters: ~
--   • {luaTransceiverIndex} (int): the index of the LuaTransceiver where 0 is the first one
-- Return: ~
-- (int) the number of missiles associated with that LuaTransceiver
--- @param luaTransceiverIndex number
--- @return number
function I:GetLuaControlledMissileCount(luaTransceiverIndex) end

-- See the Components tab for the BlockInfo structure
-- Parameters: ~
--   • {luaTransceiverIndex} (int): the index of the LuaTransceiver where 0 is the first one
-- Return: ~
-- (BlockInfo) a BlockInfo object for the LuaTransceiver's Launchpad
--
-- BlockInfo
-- Valid:[bool] false means this BlockInfo packet is useless
-- Position:[Vector3] position in world (east,up,north)
-- LocalPosition:[Vector3] position in construct (right,up,forwards)
-- LocalPositionRelativeToCom:[Vector3] local position relative to the center of mass
-- Forwards:[Vector3] forwards direction in world(east,up,north)
-- LocalForwards:[Vector3] forward direction in construct (right,up,forwards)
-- Rotation:[Quaternion] the rotation of the block in world coordinates
-- LocalRotation:[Quaternion] the rotation of the block in the vehicle's (or turret's) coordinate system.
-- SubConstructIdentifier:[int] the sub construct identifier of the subconstruct the block is part of.
-- CustomName:[string] the custom name assigned to the block
--- @param luaTransceiverIndex number
--- @return any
function I:GetLuaTransceiverInfo(luaTransceiverIndex) end

-- See the Missile Warning tab for the MissileWarningInfo structure
-- Parameters: ~
--   • {luaTransceiverIndex} (int): 0 is the first one.
--   • {missileIndex} (int): 0 is the first missile.
-- Return: ~
-- (MissileWarningInfo) Get a MissileWarningInfo object for your missile.
--
-- MissileWarningInfo
-- Valid: [bool] false if the warning is junk due to incorrect indices.
-- Position: [Vector3] the position of the missile
-- Velocity: [Vector3] the velocity of the missile in meters per second
-- Range : [float] the distance from centre of mass of your construct to the missile
-- Azimuth :[float] the azimuth angle between your construct's forward direction and the missile (degrees)
-- Elevation: [float] the elevation angle between your construct's forward direction and the missile (degrees)
-- TimeSinceLaunch: [float] the time since missile launch.
-- Id: [int] the unique Id of the missile
--- @param luaTransceiverIndex number
--- @param missileIndex number
--- @return any
function I:GetLuaControlledMissileInfo(luaTransceiverIndex,missileIndex) end

-- Sets the aim point. No guidance modules will help achieve this aim point so do your own predictive guidance. Needs a lua receiver component ON the missile to work.
-- Parameters: ~
--   • {luaTransceiverIndex} (int): as above.
--   • {missileIndex} (int): as above.
--   • {z} (floats): global coordinates of the aim point
--- @param luaTransceiverIndex number
--- @param missileIndex number
--- @param z any
function I:SetLuaControlledMissileAimPoint(luaTransceiverIndex,missileIndex,x,y,z) end

-- Explodes the missile. Needs a lua receiver component ON the missile to work.
-- Parameters: ~
--   • {luaTransceiverIndex} (int): as above.
--   • {missileIndex} (int): as above.
--- @param luaTransceiverIndex number
--- @param missileIndex number
function I:DetonateLuaControlledMissile(luaTransceiverIndex,missileIndex) end

-- Find out if the missile has an interceptor capability.
-- Parameters: ~
--   • {luaTransceiverIndex} (int): 0 is the first one
--   • {missileIndex} (int): 0 is the first one
-- Return: ~
-- [bool]: true means the missile has an interceptor module, otherwise false is returned. If the missile has no lua receiver false will be returned.
--- @param luaTransceiverIndex number
--- @param missileIndex number
--- @return any
function I:IsLuaControlledMissileAnInterceptor(luaTransceiverIndex,missileIndex) end

-- Set the target of an interceptor missile to be a specific missile for which a warning exists. This is enough to get the interceptor missile to behave normally but if you want to actually guide it yourself use SetLuaControlledMissileInterceptorStandardGuidanceOnOff to turn the guidance off.
-- Parameters: ~
--   • {luaTransceiverIndex} (int): 0 is the first one
--   • {missileIndex} (int): 0 is the first one,
--   • {targetIndex} (int): 0 is the first missile which that mainframe has a warning for
--- @param luaTransceiverIndex number
--- @param missileIndex number
--- @param targetIndex number
function I:SetLuaControlledMissileInterceptorTarget(luaTransceiverIndex,missileIndex,targetIndex) end

-- Turns standard guidance for the missile on and off. Turn it off if you're going to guide the missile in yourself.
-- Parameters: ~
--   • {luaTransceiverIndex} (int): 0 is the first one
--   • {missileIndex} (int): 0 is the first one
--   • {onOff} (bool): true will use standard missile guidance to aim at the interceptors target, false will rely on SetLuaControlledMissileAimPoint for aiming coordinates.
--- @param luaTransceiverIndex number
--- @param missileIndex number
--- @param onOff boolean
function I:SetLuaControlledMissileInterceptorStandardGuidanceOnOff(luaTransceiverIndex,missileIndex, onOff) end

-- Set the speed factor. In continuous mode spinners this allows some blades to spin slower than others, in insta-spin blades this is related to the speed they are spinning at (1 is max speed, 0 is no speed), and in rotation spinners this does nothing.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {speedFactor} (float): 0 to 1, the fractional power output
--- @param SubConstructIdentifier number
--- @param speedFactor number
function I:SetSpinBlockSpeedFactor(SubConstructIdentifier,speedFactor) end

-- Sets the power drive. this allows heliblades to produce more force. Requires engine power. 0 removes engine use. 10 is maximum power use.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {drive} (float): the relative power use of the spinner (0 to 10).
--- @param SubConstructIdentifier number
--- @param drive number
function I:SetSpinBlockPowerDrive(SubConstructIdentifier,drive) end

-- Sets the angle of rotation. Changes the spinner into Rotate mode. 'Rotatebackwards' is not available through this interface but you shouldn't need it.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {angle} (float): angle in degrees to turn to.
--- @param SubConstructIdentifier number
--- @param angle number
function I:SetSpinBlockRotationAngle(SubConstructIdentifier, angle) end

-- Sets the speed of rotation. Changes the spinner into continuous mode. 'ContinuouseReverse' mode is not available through this interface so set the speed negative to facilitate reverse spinning.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {speed} (float): speed to rotate at. 30 is the maximum so values from -30 to 30 work.
--- @param SubConstructIdentifier number
--- @param speed number
function I:SetSpinBlockContinuousSpeed(SubConstructIdentifier, speed) end

-- Pistons have their own interface because they use 'SubConstruct' identifiers
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {magnitudeAndDirection} (float): -1 means spin backwards full speed, 1 is spin forwards full speed
--- @param SubConstructIdentifier number
--- @param magnitudeAndDirection number
function I:SetSpinBlockInstaSpin(SubConstructIdentifier,magnitudeAndDirection) end

-- Get the extension of the piston, -1 if not found.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
-- Return: ~
-- (float) the extension distance of the piston in meters
--- @param SubConstructIdentifier number
--- @return number
function I:GetPistonExtension(SubConstructIdentifier) end

-- Get the velocity of the piston (always positive), -1 if not found.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
-- Return: ~
-- (float) the velocity of the piston in meters per second
--- @param SubConstructIdentifier number
--- @return number
function I:GetPistonVelocity(SubConstructIdentifier) end

-- Set the extension of the piston.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {ExtensionDistance} (float): the extension distance of the piston (in meters, will be clamped if necessary)
--- @param SubConstructIdentifier number
--- @param ExtensionDistance number
function I:SetPistonExtension(SubConstructIdentifier,ExtensionDistance) end

-- Dedicated helicopter spinners have their own interface because they have their own indexing system
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct.
--   • {ExtensionVelocity} (float): the velocity of the piston in meters per second (between 0.1 and 2)
--- @param SubConstructIdentifier number
--- @param ExtensionVelocity number
function I:SetPistonVelocity(SubConstructIdentifier,ExtensionVelocity) end

-- Returns the number of dedicated helicopter spinners
-- Return: ~
-- (int) the number of dedicated helicopter spinners
--- @return number
function I:GetDedibladeCount() end

-- Returns block info for the dedicated helicopter spinner.
-- Parameters: ~
--   • {DedibladeIndex} (int): 0 is the first dedicated helicopter spinner
-- Return: ~
-- (BlockInfo) a block info object for the dedicated helicopter spinner.
--
-- BlockInfo
-- Valid:[bool] false means this BlockInfo packet is useless
-- Position:[Vector3] position in world (east,up,north)
-- LocalPosition:[Vector3] position in construct (right,up,forwards)
-- LocalPositionRelativeToCom:[Vector3] local position relative to the center of mass
-- Forwards:[Vector3] forwards direction in world(east,up,north)
-- LocalForwards:[Vector3] forward direction in construct (right,up,forwards)
-- Rotation:[Quaternion] the rotation of the block in world coordinates
-- LocalRotation:[Quaternion] the rotation of the block in the vehicle's (or turret's) coordinate system.
-- SubConstructIdentifier:[int] the sub construct identifier of the subconstruct the block is part of.
-- CustomName:[string] the custom name assigned to the block
--- @param DedibladeIndex number
--- @return any
function I:GetDedibladeInfo(DedibladeIndex) end

-- Returns whether the dedicated helicopter spinner is on the hull or on a SubConstruct.
-- Parameters: ~
--   • {DedibladeIndex} (int): 0 is the first dedicated helicopter spinner
-- Return: ~
-- (bool) true if on hull
--- @param DedibladeIndex number
--- @return boolean
function I:IsDedibladeOnHull(DedibladeIndex) end

-- Set the speed factor. In continuous mode spinners this allows some blades to spin slower than others, in insta-spin blades this is related to the speed they are spinning at (1 is max speed, 0 is no speed), and in rotation spinners this does nothing.
-- Parameters: ~
--   • {DedibladeIndex} (int): 0 is the first dedicated helicopter spinner.
--   • {speedFactor} (float): 0 to 1, the fractional power output
--- @param DedibladeIndex number
--- @param speedFactor number
function I:SetDedibladeSpeedFactor(DedibladeIndex,speedFactor) end

-- Sets the power drive. this allows heliblades to produce more force. Requires engine power. 0 removes engine use. 10 is maximum power use.
-- Parameters: ~
--   • {DedibladeIndex} (int): 0 is the first dedicated helicopter spinner.
--   • {drive} (float): the relative power use of the dedicated helicopter spinner (0 to 10).
--- @param DedibladeIndex number
--- @param drive number
function I:SetDedibladePowerDrive(DedibladeIndex,drive) end

-- Sets the speed of rotation. Changes the dedicated helicopter spinner into continuous mode. 'ContinuouseReverse' mode is not available through this interface so set the speed negative to facilitate reverse spinning.
-- Parameters: ~
--   • {DedibladeIndex} (int): 0 is the first dedicated helicopter spinner.
--   • {speed} (float): speed to rotate at. 30 is the maximum so values from -30 to 30 work.
--- @param DedibladeIndex number
--- @param speed number
function I:SetDedibladeContinuousSpeed(DedibladeIndex, speed) end

-- Spins the blades in a direction and speed determined by magnitudeAndDirection. Will set the dedicated helicopter spinner into instaspin forwards mode and will affect speed factor variable of the spinner.
-- Parameters: ~
--   • {DedibladeIndex} (int): 0 is the first dedicated helicopter spinner.
--   • {magnitudeAndDirection} (float): -1 means spin backwards full speed, 1 is spin forwards full speed
--- @param DedibladeIndex number
--- @param magnitudeAndDirection number
function I:SetDedibladeInstaSpin(DedibladeIndex,magnitudeAndDirection) end

-- Returns the number of SubConstructs on the vehicle, including SubConstructs on SubConstructs
-- Return: ~
-- (int) the total number of SubConstructs on the vehicle
--- @return number
function I:GetAllSubconstructsCount() end

-- Returns the identifier of the SubConstruct. The indices start at 0 and are in no particular order
-- Parameters: ~
--   • {index} (int): 0 is the first SubConstruct
-- Return: ~
-- (int) the persistent indentifier of the SubConstruct
--- @param index number
--- @return number
function I:GetSubConstructIdentifier(index) end

-- Returns the number of SubConstructs on the given SubConstruct
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (int) all the number of SubConstructs directly placed on the given SubConstruct.
--- @param SubConstructIdentifier number
--- @return number
function I:GetSubconstructsChildrenCount(SubConstructIdentifier) end

-- Returns the identifier of the child SubConstruct placed on the parent SubConstruct. The indices start at 0 and are in no particular order
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the parent SubConstruct
--   • {index} (int): 0 is the first child SubConstruct
-- Return: ~
-- (int) the persistent indentifier of the SubConstruct
--- @param SubConstructIdentifier number
--- @param index number
--- @return number
function I:GetSubConstructChildIdentifier(SubConstructIdentifier, index) end

-- Returns the persistent index of the parent SubConstruct of the given SubConstruct, '0' for the MainConstruct, '-1' if not found
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (int) the persistent index of the parent SubConstruct of the given SubConstruct.
--- @param SubConstructIdentifier number
--- @return number
function I:GetParent(SubConstructIdentifier) end

-- Indicates if the SubConstruct is a turret or not
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (bool) 'true' if the SubConstruct is a turret, 'false' otherwise.
--- @param SubConstructIdentifier number
--- @return boolean
function I:IsTurret(SubConstructIdentifier) end

-- Indicates if the SubConstruct is a spin block or not
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (bool) 'true' if the SubConstruct is a spin block, 'false' otherwise.
--- @param SubConstructIdentifier number
--- @return boolean
function I:IsSpinBlock(SubConstructIdentifier) end

-- Indicates if the SubConstruct is a piston or not
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (bool) 'true' if the SubConstruct is a piston, 'false' otherwise.
--- @param SubConstructIdentifier number
--- @return boolean
function I:IsPiston(SubConstructIdentifier) end

-- Indicates if the SubConstruct is destroyed or not
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (bool) 'true' if the SubConstruct is not completely destroyed.
--- @param SubConstructIdentifier number
--- @return boolean
function I:IsAlive(SubConstructIdentifier) end

-- Indicates if the SubConstruct is on the hull or not
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (bool) 'true' if the SubConstruct is on the hull.
--- @param SubConstructIdentifier number
--- @return boolean
function I:IsSubConstructOnHull(SubConstructIdentifier) end

-- Returns a BlockInfo object for the active block of the SubConstruct, and invalid BlockInfo if the SubConstruct hasn't been found.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (BlockInfo) a BlockInfo object for the SubConstruct active block (the SpinBlock block, the piston or the turret block)
--
-- BlockInfo
-- Valid:[bool] false means this BlockInfo packet is useless
-- Position:[Vector3] position in world (east,up,north)
-- LocalPosition:[Vector3] position in construct (right,up,forwards)
-- LocalPositionRelativeToCom:[Vector3] local position relative to the center of mass
-- Forwards:[Vector3] forwards direction in world(east,up,north)
-- LocalForwards:[Vector3] forward direction in construct (right,up,forwards)
-- Rotation:[Quaternion] the rotation of the block in world coordinates
-- LocalRotation:[Quaternion] the rotation of the block in the vehicle's (or turret's) coordinate system.
-- SubConstructIdentifier:[int] the sub construct identifier of the subconstruct the block is part of.
-- CustomName:[string] the custom name assigned to the block
--- @param SubConstructIdentifier number
--- @return any
function I:GetSubConstructInfo(SubConstructIdentifier) end

-- Returns a Quaternion representing the orientation of the block in its parent SubConstruct as it was when it was placed.
-- Parameters: ~
--   • {SubConstructIdentifier} (int): the persistent identifier of the SubConstruct
-- Return: ~
-- (Quaternion) the rotation of the subconstruct relative to its parent as it was first placed.
--- @param SubConstructIdentifier number
--- @return any
function I:GetSubConstructIdleRotation(SubConstructIdentifier) end

-- Returns the number of friendly constructs
-- Return: ~
-- (int) the number of friendlies spawned into the world
--- @return number
function I:GetFriendlyCount() end

-- Returns a friendly info object for a friendly vehicle
-- Parameters: ~
--   • {index} (int): 0 is the first construct
-- Return: ~
-- (FriendlyInfo) the FriendlyInfo object
--
-- FriendlyInfo
-- Valid:[bool] false if the Friendly Info could not be retrieved
-- Rotation:[Quaternion] the rotation of the friendly construct
-- ReferencePosition: [Vector3] the position of the construct (world East Up North frame) from which PositiveSize and Negative size are referenced
-- PositiveSize: [Vector3] the extent of the construct in the right,up,forwards direction relative to ReferencePostion
-- NegativeSize: [Vector3] the extent of the construct in the left,down,back direction relative to ReferencePosition
-- CenterOfMass: [Vector3] the centre of mass of the construct in world East Up North frame
-- Velocity: [Vector3] the velocity of the construct in world East Up North frame
-- UpVector: [Vector3] The up vector in world East Up North frame
-- RightVector: [Vector3] The up vector in world East Up North frame
-- ForwardVector: [Vector3] The forward vector in world East Up North frame
-- HealthFraction: [float] the fraction of health (including turrets etc)
-- SparesFraction: [float] the spares fraction. Returns 1 if no spares storage present
-- AmmoFraction: [float] the ammo fraction. Returns 1 if no ammo storage present
-- FuelFraction: [float] the fuel fraction. Returns 1 if no fuel storage present
-- EnergyFraction: [float] the energy fraction. Returns 1 if no batteries present
-- PowerFraction: [float] the power fraction. Returns 1 if no fuel storage present
-- ElectricPowerFraction: [float] the electric power fraction. Returns 1 if no fuel storage present
-- AxisAlignedBoundingBoxMinimum: [Vector3] the world East Up North minimum extent of the construct
-- AxisAlignedBoundingBoxMaximum: [Vector3] the world East Up North maximum extent of the construct
-- BlueprintName: [string] the name
-- Id: [int] the unique Id of the construct
--- @param index number
--- @return any
function I:GetFriendlyInfo(index) end

-- Returns a friendly info object for an Id
-- Parameters: ~
--   • {Id} (int): the Id you want
-- Return: ~
-- (FriendlyInfo) the FriendlyInfo object
--
-- FriendlyInfo
-- Valid:[bool] false if the Friendly Info could not be retrieved
-- Rotation:[Quaternion] the rotation of the friendly construct
-- ReferencePosition: [Vector3] the position of the construct (world East Up North frame) from which PositiveSize and Negative size are referenced
-- PositiveSize: [Vector3] the extent of the construct in the right,up,forwards direction relative to ReferencePostion
-- NegativeSize: [Vector3] the extent of the construct in the left,down,back direction relative to ReferencePosition
-- CenterOfMass: [Vector3] the centre of mass of the construct in world East Up North frame
-- Velocity: [Vector3] the velocity of the construct in world East Up North frame
-- UpVector: [Vector3] The up vector in world East Up North frame
-- RightVector: [Vector3] The up vector in world East Up North frame
-- ForwardVector: [Vector3] The forward vector in world East Up North frame
-- HealthFraction: [float] the fraction of health (including turrets etc)
-- SparesFraction: [float] the spares fraction. Returns 1 if no spares storage present
-- AmmoFraction: [float] the ammo fraction. Returns 1 if no ammo storage present
-- FuelFraction: [float] the fuel fraction. Returns 1 if no fuel storage present
-- EnergyFraction: [float] the energy fraction. Returns 1 if no batteries present
-- PowerFraction: [float] the power fraction. Returns 1 if no fuel storage present
-- ElectricPowerFraction: [float] the electric power fraction. Returns 1 if no fuel storage present
-- AxisAlignedBoundingBoxMinimum: [Vector3] the world East Up North minimum extent of the construct
-- AxisAlignedBoundingBoxMaximum: [Vector3] the world East Up North maximum extent of the construct
-- BlueprintName: [string] the name
-- Id: [int] the unique Id of the construct
--- @param Id number
--- @return any
function I:GetFriendlyInfoById(Id) end

