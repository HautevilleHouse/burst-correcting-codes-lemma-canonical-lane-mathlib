import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstInterleaverConfig where
  depth : Nat
  blockSize : Nat
  interleaveMatrix : List (List Bool)
  depthPos : depth > 0
  blockSizePos : blockSize > 0
  matrixValid : interleaveMatrix.length = depth ∧ (∀ row, row.length = blockSize)

structure BurstInterleaverEvidence (C : BurstInterleaverConfig) where
  depthPosClosed : C.depthPos
  blockSizePosClosed : C.blockSizePos
  matrixValidClosed : C.matrixValid

def BurstInterleaverClosed (C : BurstInterleaverConfig) : Prop :=
  C.depthPos ∧ C.blockSizePos ∧ C.matrixValid

theorem burst_interleaver_closed_from_evidence (C : BurstInterleaverConfig) (E : BurstInterleaverEvidence C) : BurstInterleaverClosed C := by
  exact And.intro E.depthPosClosed
    (And.intro E.blockSizePosClosed E.matrixValidClosed)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse