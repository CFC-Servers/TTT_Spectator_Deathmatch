if SERVER then
    AddCSLuaFile()

    if SpecDM.LoadoutEnabled then
        resource.AddFile( "materials/vgui/spec_dm/icon_sdm_mp5.vmt" )
    end
else
    SWEP.PrintName  = "MP5"
    SWEP.Slot       = 2
    SWEP.Icon       = "vgui/spec_dm/icon_sdm_mp5"
    SWEP.IconLetter = "x"
end

SWEP.HoldType            = "ar2"

SWEP.Base                = "weapon_ghost_base"

SWEP.Kind                = WEAPON_HEAVY
SWEP.WeaponID            = AMMO_MP5

SWEP.Primary.Damage      = 13
SWEP.Primary.Delay       = 0.08
SWEP.Primary.Cone        = 0.025
SWEP.Primary.ClipSize    = 30
SWEP.Primary.ClipMax     = 100
SWEP.Primary.DefaultClip = 900
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo        = "smg1"
SWEP.Primary.Recoil      = 0.6
SWEP.Primary.Sound       = Sound( "Weapon_MP5Navy.Single" )
SWEP.AutoSpawnable       = false

SWEP.NoAmmoEnt           = "item_ammo_smg1_ttt"

SWEP.ViewModel           = "models/weapons/cstrike/c_smg_mp5.mdl"
SWEP.WorldModel          = "models/weapons/w_smg_mp5.mdl"

SWEP.Primary.Sound       = Sound( "Weapon_MP5Navy.Single" )

SWEP.IronSightsPos       = Vector( -5.32, -10, 1.6 )
SWEP.IronSightsAng       = Vector( 2.2, 0, 0 )
SWEP.ViewModelFlip       = false
SWEP.ViewModelFOV        = 60

function SWEP:GetHeadshotMultiplier( victim, dmginfo )
    local att = dmginfo:GetAttacker()

    if not IsValid( att ) then
        return 2
    end

    local dist = victim:GetPos():Distance( att:GetPos() )
    local d = math.max( 0, dist - 150 )

    -- decay from 3.2 to 1.7
    return 1.7 + math.max( 0, (1.5 - 0.002 * (d ^ 1.25)) )
end
