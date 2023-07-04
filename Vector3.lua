-- NO INCLUDE
Vector3 = {}

-- Linearly interpolates between two vectors.
---@param a Vector3
---@param b Vector3
---@param t number
---@return Vector3
function Vector3.Lerp(a, b, t) end

-- Linearly interpolates between two vectors without clamping the interpolant
---@param a Vector3
---@param b Vector3
---@param t number
---@return Vector3
function Vector3.LerpUnclamped(a, b, t) end

-- Moves a point /current/ in a straight line towards a /target/ point.
---@param current Vector3
---@param target Vector3
---@param maxDistanceDelta number
---@return Vector3
function Vector3.MoveTowards(current, target, maxDistanceDelta) end

---@param current Vector3
---@param target Vector3
---@param Vector3 ref
---@param smoothTime number
---@param maxSpeed number
---@return Vector3
function Vector3.SmoothDamp(current, target, Vector3, smoothTime, maxSpeed) end

---@param current Vector3
---@param target Vector3
---@param Vector3 ref
---@param smoothTime number
---@return Vector3
function Vector3.SmoothDamp(current, target, Vector3, smoothTime) end

-- Gradually changes a vector towards a desired goal over time.
---@param current Vector3
---@param target Vector3
---@param Vector3 ref
---@param smoothTime number
---@param  [uei.DefaultValue("Mathf.Infinity")]
---@param  [uei.DefaultValue("Time.deltaTime")]
---@return Vector3
function Vector3.SmoothDamp(current, target, Vector3, smoothTime, , ) end

-- Creates a new vector with given x, y, z components.
---@param x number
---@param y number
---@param z number
---@return None
function Vector3(x, y, z) end

-- Creates a new vector with given x, y components and sets /z/ to zero.
---@param x number
---@param y number
---@return None
function Vector3(x, y) end

-- Set x, y and z components of an existing Vector3.
---@param newX number
---@param newY number
---@param newZ number
function Vector3:Set(newX, newY, newZ) end

-- Multiplies two vectors component-wise.
---@param a Vector3
---@param b Vector3
---@return Vector3
function Vector3.Scale(a, b) end

-- Multiplies every component of this vector by the same component of /scale/.
---@param scale Vector3
function Vector3:Scale(scale) end

-- Cross Product of two vectors.
---@param lhs Vector3
---@param rhs Vector3
---@return Vector3
function Vector3.Cross(lhs, rhs) end

---@param other Vector3
---@return bool
function Vector3:Equals(other) end

-- Reflects a vector off the plane defined by a normal.
---@param inDirection Vector3
---@param inNormal Vector3
---@return Vector3
function Vector3.Reflect(inDirection, inNormal) end

-- Returns this vector with a magnitude of 1 (RO).
-- Use .normalized property instead.
---@param value Vector3
---@return Vector3
function Vector3.Normalize(value) end

-- Makes this vector have a magnitude of 1.
function Vector3:Normalize() end

-- Dot Product of two vectors.
---@param lhs Vector3
---@param rhs Vector3
---@return number
function Vector3.Dot(lhs, rhs) end

-- Projects a vector onto another vector.
---@param vector Vector3
---@param onNormal Vector3
---@return Vector3
function Vector3.Project(vector, onNormal) end

-- Projects a vector onto a plane defined by a normal orthogonal to the plane.
---@param vector Vector3
---@param planeNormal Vector3
---@return Vector3
function Vector3.ProjectOnPlane(vector, planeNormal) end

-- Returns the angle in degrees between /from/ and /to/. This is always the smallest
---@param from Vector3
---@param to Vector3
---@return number
function Vector3.Angle(from, to) end

-- The smaller of the two possible angles between the two vectors is returned, therefore the result will never be greater than 180 degrees or smaller than -180 degrees.
-- If you imagine the from and to vectors as lines on a piece of paper, both originating from the same point, then the /axis/ vector would point up out of the paper.
-- The measured angle between the two vectors would be positive in a clockwise direction and negative in an anti-clockwise direction.
---@param from Vector3
---@param to Vector3
---@param axis Vector3
---@return number
function Vector3.SignedAngle(from, to, axis) end

-- Returns the distance between /a/ and /b/.
---@param a Vector3
---@param b Vector3
---@return number
function Vector3.Distance(a, b) end

-- Returns a copy of /vector/ with its magnitude clamped to /maxLength/.
---@param vector Vector3
---@param maxLength number
---@return Vector3
function Vector3.ClampMagnitude(vector, maxLength) end

-- Returns the length of this vector (RO).
-- Use .magnitude property instead
---@param vector Vector3
---@return number
function Vector3.Magnitude(vector) end

-- Returns the squared length of this vector (RO).
-- Use .sqrMagnitude property instead
---@param vector Vector3
---@return number
function Vector3.SqrMagnitude(vector) end

-- Returns a vector that is made from the smallest components of two vectors.
---@param lhs Vector3
---@param rhs Vector3
---@return Vector3
function Vector3.Min(lhs, rhs) end

-- Returns a vector that is made from the largest components of two vectors.
---@param lhs Vector3
---@param rhs Vector3
---@return Vector3
function Vector3.Max(lhs, rhs) end

-- Shorthand for writing @@Vector3(0, 0, 0)@@
---@type Vector3
Vector3.zero = nil

-- Shorthand for writing @@Vector3(1, 1, 1)@@
---@type Vector3
Vector3.one = nil

-- Shorthand for writing @@Vector3(0, 0, 1)@@
---@type Vector3
Vector3.forward = nil

---@type Vector3
Vector3.back = nil

-- Shorthand for writing @@Vector3(0, 1, 0)@@
---@type Vector3
Vector3.up = nil

---@type Vector3
Vector3.down = nil

---@type Vector3
Vector3.left = nil

-- Shorthand for writing @@Vector3(1, 0, 0)@@
---@type Vector3
Vector3.right = nil

-- Shorthand for writing @@Vector3(number.PositiveInfinity, number.PositiveInfinity, number.PositiveInfinity)@@
---@type Vector3
Vector3.positiveInfinity = nil

-- Shorthand for writing @@Vector3(number.NegativeInfinity, number.NegativeInfinity, number.NegativeInfinity)@@
---@type Vector3
Vector3.negativeInfinity = nil

