import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCodeState where
  code : PrimitiveBurstCode
  channel : BurstChannel
  error : BurstError
  syndrome : Type u
  corrected : Bool

open HautevilleHouse.CanonicalLaneMathlibCore

def burstProjection : Projection BurstCodeState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem burst_projection_idempotent (x : BurstCodeState) :
    burstProjection.toFun (burstProjection.toFun x) = burstProjection.toFun x := by
  exact burstProjection.idempotent x

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
