import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstChannel where
  alphabet : Type u
  burstLength : Nat
  errorModel : Type v
  errorProbability : Prop

defaultChannels : List BurstChannel := []

structure BurstError where
  position : Nat
  pattern : List Bool
  length : Nat

structure PrimitiveBurstCode where
  blockLength : Nat
  generatorMatrix : Type u
  parityCheckMatrix : Type v
  burstCorrectionCapability : Nat
  encoder : Type w
  decoder : Type x
  encodingCorrect : Prop
  decodingCorrect : Prop
  burstErrorDetected : Prop
  errorFreeRecovery : Prop

structure PrimitiveBurstCodeEvidence (C : PrimitiveBurstCode) where
  encodingCorrectClosed : C.encodingCorrect
  decodingCorrectClosed : C.decodingCorrect
  burstErrorDetectedClosed : C.burstErrorDetected
  errorFreeRecoveryClosed : C.errorFreeRecovery

def PrimitiveBurstCodeClosed (C : PrimitiveBurstCode) : Prop :=
  C.encodingCorrect ∧ C.decodingCorrect ∧ C.burstErrorDetected ∧ C.errorFreeRecovery

theorem primitive_burst_code_closed_from_evidence (C : PrimitiveBurstCode) (E : PrimitiveBurstCodeEvidence C) :
    PrimitiveBurstCodeClosed C := by
  exact And.intro E.encodingCorrectClosed
    (And.intro E.decodingCorrectClosed
      (And.intro E.burstErrorDetectedClosed E.errorFreeRecoveryClosed))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
