import canonicalLaneMathlib.AdmissibleClass
import BurstCorrectingCodesLemmaCanonicalLaneLean.BurstCodesAdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorModelPackage where
  maxBurstLength : Nat
  errorDetectionCapability : Prop
  errorCorrectionCapability : Prop
  modelConsistent : Prop

structure BurstErrorModelEvidence (E : BurstErrorModelPackage) where
  maxBurstLengthClosed : E.maxBurstLength = 0 ∨ E.maxBurstLength > 0
  errorDetectionCapabilityClosed : E.errorDetectionCapability
  errorCorrectionCapabilityClosed : E.errorCorrectionCapability
  modelConsistentClosed : E.modelConsistent

def BurstErrorModelClosed (E : BurstErrorModelPackage) : Prop :=
  (E.maxBurstLength = 0 ∨ E.maxBurstLength > 0) ∧
  E.errorDetectionCapability ∧
  E.errorCorrectionCapability ∧
  E.modelConsistent

theorem burst_error_model_closed_from_evidence
    (E : BurstErrorModelPackage) (Ev : BurstErrorModelEvidence E) :
    BurstErrorModelClosed E := by
  exact And.intro Ev.maxBurstLengthClosed
    (And.intro Ev.errorDetectionCapabilityClosed
      (And.intro Ev.errorCorrectionCapabilityClosed Ev.modelConsistentClosed))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse