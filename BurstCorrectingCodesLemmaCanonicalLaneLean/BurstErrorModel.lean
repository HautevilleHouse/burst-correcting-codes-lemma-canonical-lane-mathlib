import BurstCorrectingCodesLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Burst Error Model Package
-/

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorModel where
  burstLengthBound : ℕ
  burstType : Type
  errorPatterns : List burstType
  detectionCapability : Prop
  correctionCapability : Prop

structure BurstErrorModelEvidence (M : BurstErrorModel) where
  burstLengthBoundClosed : M.burstLengthBound > 0
  errorPatternsNonempty : M.errorPatterns ≠ []

def BurstErrorModelClosed (M : BurstErrorModel) : Prop :=
  M.burstLengthBound > 0 ∧ M.errorPatterns ≠ []

theorem burst_error_model_closed_from_evidence (M : BurstErrorModel)
    (E : BurstErrorModelEvidence M) : BurstErrorModelClosed M := by
  exact And.intro E.burstLengthBoundClosed E.errorPatternsNonempty

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse