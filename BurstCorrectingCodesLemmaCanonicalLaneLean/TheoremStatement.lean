import Mathlib.Data.List.Basic

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstSpace where
  carrier : Type
  alphabet : Type
  burstLength : ℕ
  codeLength : ℕ
  burstErrorModel : Prop

structure BurstAdmittedObject where
  space : BurstSpace
  burstCorrectingCode : Prop
  errorDetectionCapability : Prop
  maxBurstLengthCorrectable : ℕ
  efficiencyBound : Prop
  conclusion : burstCorrectingCode ∧ errorDetectionCapability ∧ efficiencyBound

def BurstWitnessClosed (O : BurstAdmittedObject) : Prop :=
  O.burstCorrectingCode ∧ O.errorDetectionCapability ∧ O.efficiencyBound

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse