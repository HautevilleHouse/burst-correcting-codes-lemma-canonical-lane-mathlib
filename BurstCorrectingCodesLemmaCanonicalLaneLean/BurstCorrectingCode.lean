import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCorrectingCodePackage (M : BurstErrorModelPackage) where
  codeLength : Nat
  dimension : Nat
  burstErrorCorrectionRadius : Nat
  encoderMapping : Type u
  decoderMapping : Type v
  minimumDistance : Nat

structure BurstCorrectingCodeEvidence {M : BurstErrorModelPackage} (C : BurstCorrectingCodePackage M) where
  burstErrorCorrectionRadiusClosed : C.burstErrorCorrectionRadius ≥ 1
  minimumDistanceClosed : C.minimumDistance ≥ 2

def BurstCorrectingCodeClosed {M : BurstErrorModelPackage} (C : BurstCorrectingCodePackage M) : Prop :=
  C.burstErrorCorrectionRadius ≥ 1 ∧ C.minimumDistance ≥ 2

theorem burst_correcting_code_closed_from_evidence {M : BurstErrorModelPackage} (C : BurstCorrectingCodePackage M) (E : BurstCorrectingCodeEvidence C) :
    BurstCorrectingCodeClosed C := by
  exact And.intro E.burstErrorCorrectionRadiusClosed E.minimumDistanceClosed

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse