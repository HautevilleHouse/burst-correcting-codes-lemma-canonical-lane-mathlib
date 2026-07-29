import BurstCorrectingCodesLemmaCanonicalLaneLean.BurstErrorModel

/-!
# Interleaving Scheme Package
-/

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure InterleavingScheme (M : BurstErrorModel) where
  interleavingDepth : ℕ
  deinterleavingFunction : Type
  burstDispersionProperty : Prop
  correctionPreservation : Prop

structure InterleavingSchemeEvidence {M : BurstErrorModel}
    (I : InterleavingScheme M) where
  burstDispersionPropertyClosed : I.burstDispersionProperty
  correctionPreservationClosed : I.correctionPreservation

def InterleavingSchemeClosed {M : BurstErrorModel} (I : InterleavingScheme M) : Prop :=
  I.burstDispersionProperty ∧ I.correctionPreservation

theorem interleaving_scheme_closed_from_evidence {M : BurstErrorModel}
    (I : InterleavingScheme M) (E : InterleavingSchemeEvidence I) :
    InterleavingSchemeClosed I := by
  exact And.intro E.burstDispersionPropertyClosed E.correctionPreservationClosed

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse