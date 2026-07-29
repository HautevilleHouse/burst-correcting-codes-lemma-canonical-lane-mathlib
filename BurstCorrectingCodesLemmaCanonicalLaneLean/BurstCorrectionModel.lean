import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCorrectionModel where
  code : PrimitiveBurstCode
  channel : BurstChannel
  errorBound : Nat
  correctionGuarantee : Prop
  efficientAlgorithm : Prop

structure BurstCorrectionModelEvidence (M : BurstCorrectionModel) where
  correctionGuaranteeClosed : M.correctionGuarantee
  efficientAlgorithmClosed : M.efficientAlgorithm

def BurstCorrectionModelClosed (M : BurstCorrectionModel) : Prop :=
  M.correctionGuarantee ∧ M.efficientAlgorithm

theorem burst_correction_model_closed_from_evidence (M : BurstCorrectionModel) (E : BurstCorrectionModelEvidence M) :
    BurstCorrectionModelClosed M := by
  exact And.intro E.correctionGuaranteeClosed E.efficientAlgorithmClosed

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
