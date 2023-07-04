-- NO INCLUDE
Quaternion = {}

-- Constructs new Quaternion with given x,y,z,w components.
---@param x float
---@param y float
---@param z float
---@param w float
function Quaternion(x, y, z, w) end

-- Set x, y, z and w components of an existing Quaternion.
---@param newX float
---@param newY float
---@param newZ float
---@param newW float
function Quaternion:Set(newX, newY, newZ, newW) end

-- The identity rotation (RO). This quaternion corresponds to "no rotation": the object
---@type Quaternion
Quaternion.identity = nil

-- The dot product between two rotations.
---@param a Quaternion
---@param b Quaternion
---@return float
function Quaternion.Dot(a, b) end

-- Creates a rotation with the specified /forward/ and /upwards/ directions.
---@param view Vector3
---@param Vector3 [uei.DefaultValue("Vector3.up")]
function Quaternion:SetLookRotation(view, Vector3) end

-- Returns the angle in degrees between two rotations /a/ and /b/.
---@param a Quaternion
---@param b Quaternion
---@return float
function Quaternion.Angle(a, b) end

---@param x float
---@param y float
---@param z float
---@return Quaternion
function Quaternion.Euler(x, y, z) end

---@param euler Vector3
---@return Quaternion
function Quaternion.Euler(euler) end

---@param float out
---@param Vector3 out
function Quaternion:ToAngleAxis(float, Vector3) end

---@param fromDirection Vector3
---@param toDirection Vector3
function Quaternion:SetFromToRotation(fromDirection, toDirection) end

---@param from Quaternion
---@param to Quaternion
---@param maxDegreesDelta float
---@return Quaternion
function Quaternion.RotateTowards(from, to, maxDegreesDelta) end

-- use .normalized property
---@param q Quaternion
---@return Quaternion
function Quaternion.Normalize(q) end

function Quaternion:Normalize() end

---@type Quaternion
Quaternion.normalized = nil


-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param x float
---@param y float
---@param z float
---@return Quaternion
function Quaternion.EulerRotation(x, y, z) end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param euler Vector3
---@return Quaternion
function Quaternion.EulerRotation(euler) end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param x float
---@param y float
---@param z float
function Quaternion:SetEulerRotation(x, y, z) end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param euler Vector3
function Quaternion:SetEulerRotation(euler) end

-- Obsolete. Use Quaternion.eulerAngles instead. This function was deprecated because it uses radians instead of degrees.
---@return Vector3
function Quaternion:ToEuler() end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param x float
---@param y float
---@param z float
---@return Quaternion
function Quaternion.EulerAngles(x, y, z) end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param euler Vector3
---@return Quaternion
function Quaternion.EulerAngles(euler) end

-- Obsolete. Use Quaternion.ToAngleAxis instead. This function was deprecated because it uses radians instead of degrees.
---@param Vector3 out
---@param float out
function Quaternion:ToAxisAngle(Vector3, float) end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param x float
---@param y float
---@param z float
function Quaternion:SetEulerAngles(x, y, z) end

-- Obsolete. Use Quaternion.Euler instead. This function was deprecated because it uses radians instead of degrees.
---@param euler Vector3
function Quaternion:SetEulerAngles(euler) end

-- Obsolete. Use Quaternion.eulerAngles instead. This function was deprecated because it uses radians instead of degrees.
---@param rotation Quaternion
---@return Vector3
function Quaternion.ToEulerAngles(rotation) end

-- Obsolete. Use Quaternion.eulerAngles instead. This function was deprecated because it uses radians instead of degrees.
---@return Vector3
function Quaternion:ToEulerAngles() end

-- Obsolete. Use Quaternion.AngleAxis instead. This function was deprecated because it uses radians instead of degrees.
---@param axis Vector3
---@param angle float
function Quaternion:SetAxisAngle(axis, angle) end

-- Obsolete. Use Quaternion.AngleAxis instead. This function was deprecated because it uses radians instead of degrees
static Quaternion AxisAngle(Vector3 axis, float angle) 


