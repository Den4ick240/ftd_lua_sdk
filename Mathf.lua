-- NO INCLUDE
Mathf = {}

-- Returns the sine of angle /f/ in radians.
---@param f number
---@return number
function Mathf:Sin(f) end

-- Returns the cosine of angle /f/ in radians.
---@param f number
---@return number
function Mathf:Cos(f) end

-- Returns the tangent of angle /f/ in radians.
---@param f number
---@return number
function Mathf:Tan(f) end

-- Returns the arc-sine of /f/ - the angle in radians whose sine is /f/. 
---@param f number
---@return number
function Mathf:Asin(f) end

-- Returns the arc-cosine of /f/ - the angle in radians whose cosine is /f/.
---@param f number
---@return number
function Mathf:Acos(f) end

-- Returns the arc-tangent of /f/ - the angle in radians whose tangent is /f/.
---@param f number
---@return number
function Mathf:Atan(f) end

-- Returns the angle in radians whose ::ref::Tan is @@y/x@@.
---@param y number
---@param x number
---@return number
function Mathf:Atan2(y, x) end

-- Returns square root of /f/.
---@param f number
---@return number
function Mathf:Sqrt(f) end

-- Returns the absolute value of /value/.
---@param value number
---@return number
function Mathf:Abs(value) end

-- Returns the smallest of two values.
---@param a number
---@param b number
---@return number
function Mathf:Min(a, b) end

-- Returns largest of two values.
---@param a number
---@param b number
---@return number
function Mathf:Max(a, b) end

-- Returns /f/ raised to power /p/.
---@param f number
---@param p number
---@return number
function Mathf:Pow(f, p) end

-- Returns e raised to the specified power.
---@param power number
---@return number
function Mathf:Exp(power) end

-- Returns the logarithm of a specified number in a specified base.
---@param f number
---@param p number
---@return number
function Mathf:Log(f, p) end

-- Returns the natural (base e) logarithm of a specified number.
---@param f number
---@return number
function Mathf:Log(f) end

-- Returns the base 10 logarithm of a specified number.
---@param f number
---@return number
function Mathf:Log10(f) end

-- Returns the smallest numbereger greater to or equal to /f/.
---@param f number
---@return number
function Mathf:Ceil(f) end

-- Returns the largest numbereger smaller to or equal to /f/.
---@param f number
---@return number
function Mathf:Floor(f) end

-- Returns /f/ rounded to the nearest numbereger.
---@param f number
---@return number
function Mathf:Round(f) end

-- Returns the smallest numbereger greater to or equal to /f/.
---@param f number
---@return number
function Mathf:CeilTonumber(f) end

-- Returns the largest numbereger smaller to or equal to /f/.
---@param f number
---@return number
function Mathf:FloorTonumber(f) end

-- Returns /f/ rounded to the nearest numbereger.
---@param f number
---@return number
function Mathf:RoundTonumber(f) end

-- Returns the sign of /f/.
---@param f number
---@return number
function Mathf:Sign(f) end

-- Clamps a value between a minimum number and maximum number value.
---@param value number
---@param min number
---@param max number
---@return number
function Mathf:Clamp(value, min, max) end

-- Clamps value between min and max and returns value.
-- Set the position of the transform to be that of the time
-- but never less than 1 or more than 3
--
---@param value number
---@param min number
---@param max number
---@return number
function Mathf:Clamp(value, min, max) end

-- Clamps value between 0 and 1 and returns value
---@param value number
---@return number
function Mathf:Clamp01(value) end

-- numbererpolates between /a/ and /b/ by /t/. /t/ is clamped between 0 and 1.
---@param a number
---@param b number
---@param t number
---@return number
function Mathf:Lerp(a, b, t) end

-- numbererpolates between /a/ and /b/ by /t/ without clamping the numbererpolant.
---@param a number
---@param b number
---@param t number
---@return number
function Mathf:LerpUnclamped(a, b, t) end

-- Same as ::ref::Lerp but makes sure the values numbererpolate correctly when they wrap around 360 degrees.
---@param a number
---@param b number
---@param t number
---@return number
function Mathf:LerpAngle(a, b, t) end

-- Moves a value /current/ towards /target/.
---@param current number
---@param target number
---@param maxDelta number
---@return number
function Mathf:MoveTowards(current, target, maxDelta) end

-- Same as ::ref::MoveTowards but makes sure the values numbererpolate correctly when they wrap around 360 degrees.
---@param current number
---@param target number
---@param maxDelta number
---@return number
function Mathf:MoveTowardsAngle(current, target, maxDelta) end

-- numbererpolates between /min/ and /max/ with smoothing at the limits.
---@param from number
---@param to number
---@param t number
---@return number
function Mathf:SmoothStep(from, to, t) end

-- Compares two numbering ponumber values if they are similar.
---@param a number
---@param b number
---@return boolean
function Mathf:Approximately(a, b) end

-- Gradually changes a value towards a desired goal over time.
---@param current number
---@param target number
---@param number ref
---@param smoothTime number
---@param maxSpeed number
---@param deltaTime number
---@return number
function Mathf:SmoothDamp(current, target, number, smoothTime, maxSpeed, deltaTime) end

-- Gradually changes an angle given in degrees towards a desired goal angle over time.
---@param current number
---@param target number
---@param number ref
---@param smoothTime number
---@param maxSpeed number
---@param deltaTime number
---@return number
function Mathf:SmoothDampAngle(current, target, number, smoothTime, maxSpeed, deltaTime) end

-- Loops the value t, so that it is never larger than length and never smaller than 0.
---@param t number
---@param length number
---@return number
function Mathf:Repeat(t, length) end

-- PingPongs the value t, so that it is never larger than length and never smaller than 0.
---@param t number
---@param length number
---@return number
function Mathf:PingPong(t, length) end

-- Calculates the ::ref::Lerp parameter between of two values.
---@param a number
---@param b number
---@param value number
---@return number
function Mathf:InverseLerp(a, b, value) end

-- Calculates the shortest difference between two given angles.
---@param current number
---@param target number
---@return number
function Mathf:DeltaAngle(current, target) end

---@param value number
---@return number
function Mathf:NextPowerOfTwo(value) end

---@param value number
---@return number
function Mathf:ClosestPowerOfTwo(value) end

---@param value number
---@return boolean
function Mathf:IsPowerOfTwo(value) end

-- The infamous ''3.14159265358979...'' value (RO).
---@type number
Mathf.PI = nil

-- A representation of positive infinity (RO).
---@type number
Mathf.Infinity = nil

-- A representation of negative infinity (RO).
---@type number
Mathf.NegativeInfinity = nil

-- Degrees-to-radians conversion constant (RO).
---@type number
Mathf.Deg2Rad = nil

-- Radians-to-degrees conversion constant (RO).
---@type number
Mathf.Rad2Deg = nil

-- A tiny numbering ponumber value (RO).
---@type number
Mathf.Epsilon = nil

