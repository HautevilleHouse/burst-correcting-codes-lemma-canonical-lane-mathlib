import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure ErrorTrappingDecoderPackage {M : BurstErrorModelPackage} {C : BurstCorrectingCodePackage M} {D : DecodingAlgorithmPackage M C} where
  shiftRegister : Type u
  feedbackPolynomial : Type v
  trapWindowSize : Nat
  errorTrappingEfficiency : Prop

structure ErrorTrappingDecoderEvidence {M : BurstErrorModelPackage} {C : BurstCorrectingCodePackage M} {D : DecodingAlgorithmPackage M C} (T : ErrorTrappingDecoderPackage M C D) where
  trapWindowSizeClosed : T.trapWindowSize ≥ 1
  errorTrappingEfficiencyClosed : T.errorTrappingEfficiency

def ErrorTrappingDecoderClosed {M : BurstErrorModelPackage} {C : BurstCorrectingCodePackage M} {D : DecodingAlgorithmPackage M C} (T : ErrorTrappingDecoderPackage M C D) : Prop :=
  T.trapWindowSize ≥ 1 ∧ T.errorTrappingEfficiency

theorem error_trapping_decoder_closed_from_evidence {M : BurstErrorModelPackage} {C : BurstCorrectingCodePackage M} {D : DecodingAlgorithmPackage M C} (T : ErrorTrappingDecoderPackage M C D) (E : ErrorTrappingDecoderEvidence T) :
    ErrorTrappingDecoderClosed T := by
  exact And.intro E.trapWindowSizeClosed E.errorTrappingEfficiencyClosed

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse