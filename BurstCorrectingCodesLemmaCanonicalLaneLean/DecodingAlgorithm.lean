import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure DecodingAlgorithm where
  syndromeComputation : Prop
  errorLocator : Prop
  errorCorrection : Prop
  algorithmComplete : Prop
  algorithmCorrect : Prop

structure DecodingAlgorithmEvidence (D : DecodingAlgorithm) where
  syndromeComputationClosed : D.syndromeComputation
  errorLocatorClosed : D.errorLocator
  errorCorrectionClosed : D.errorCorrection
  algorithmCompleteClosed : D.algorithmComplete
  algorithmCorrectClosed : D.algorithmCorrect

def DecodingAlgorithmClosed (D : DecodingAlgorithm) : Prop :=
  D.syndromeComputation ∧ D.errorLocator ∧ D.errorCorrection ∧ D.algorithmComplete ∧ D.algorithmCorrect

theorem decoding_algorithm_closed_from_evidence (D : DecodingAlgorithm) (E : DecodingAlgorithmEvidence D) : DecodingAlgorithmClosed D := by
  exact And.intro E.syndromeComputationClosed
    (And.intro E.errorLocatorClosed
      (And.intro E.errorCorrectionClosed
        (And.intro E.algorithmCompleteClosed E.algorithmCorrectClosed)))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse