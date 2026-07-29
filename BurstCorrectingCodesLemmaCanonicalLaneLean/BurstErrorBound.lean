import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Nat.Basic

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorBoundPackage (A : AdmissibleClass) where
  maxBurstLength : ℕ
  errorCorrectingCapacity : Prop
  decodingSuccessGuarantee : Prop

structure BurstErrorBoundEvidence (A : AdmissibleClass) (B : BurstErrorBoundPackage A) where
  maxBurstLengthClosed : B.maxBurstLength = A.object.burstLength
  errorCorrectingCapacityClosed : B.errorCorrectingCapacity
  decodingSuccessGuaranteeClosed : B.decodingSuccessGuarantee

def BurstErrorBoundClosed (A : AdmissibleClass) (B : BurstErrorBoundPackage A) : Prop :=
  B.maxBurstLength = A.object.burstLength ∧ B.errorCorrectingCapacity ∧ B.decodingSuccessGuarantee

theorem burst_error_bound_closed_from_evidence (A : AdmissibleClass) (B : BurstErrorBoundPackage A) (E : BurstErrorBoundEvidence A B) : BurstErrorBoundClosed A B := by
  exact And.intro E.maxBurstLengthClosed (And.intro E.errorCorrectingCapacityClosed E.decodingSuccessGuaranteeClosed)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
