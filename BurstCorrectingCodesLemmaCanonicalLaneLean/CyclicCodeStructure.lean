import BurstCorrectingCodesLemmaCanonicalLaneLean.FieldExtension

/-!
# Cyclic Code Structure Package
-/

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure CyclicCodeStructure where
  field : Type u
  n : ℕ
  generatorPolynomial : field → field
  shiftOperator : field → field
  cyclicClosed : Prop
  zeroDivisorFree : Prop

structure CyclicCodeEvidence (C : CyclicCodeStructure) where
  cyclicClosedTerm : C.cyclicClosed
  zeroDivisorFreeTerm : C.zeroDivisorFree

def CyclicCodeClosed (C : CyclicCodeStructure) : Prop :=
  C.cyclicClosed ∧ C.zeroDivisorFree

theorem cyclic_code_closed_from_evidence
    (C : CyclicCodeStructure) (E : CyclicCodeEvidence C) : CyclicCodeClosed C := by
  exact And.intro E.cyclicClosedTerm E.zeroDivisorFreeTerm

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse