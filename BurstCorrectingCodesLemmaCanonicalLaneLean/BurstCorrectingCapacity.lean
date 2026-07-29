import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCorrectingCapacity where
  codeLength : Nat
  burstLengthBound : Nat
  dimension : Nat
  redundancy : Nat
  capacity : Float
  burstLengthBoundPos : burstLengthBound > 0
  dimensionPos : dimension > 0
  redundancyNonneg : redundancy ≥ 0
  capacityNonneg : capacity ≥ 0.0
  capacityLeOne : capacity ≤ 1.0

structure BurstCapacityEvidence (C : BurstCorrectingCapacity) where
  burstLengthBoundPosClosed : C.burstLengthBoundPos
  dimensionPosClosed : C.dimensionPos
  redundancyNonnegClosed : C.redundancyNonneg
  capacityNonnegClosed : C.capacityNonneg
  capacityLeOneClosed : C.capacityLeOne

def BurstCapacityClosed (C : BurstCorrectingCapacity) : Prop :=
  C.burstLengthBoundPos ∧ C.dimensionPos ∧ C.redundancyNonneg ∧ C.capacityNonneg ∧ C.capacityLeOne

theorem burst_capacity_closed_from_evidence (C : BurstCorrectingCapacity) (E : BurstCapacityEvidence C) : BurstCapacityClosed C := by
  exact And.intro E.burstLengthBoundPosClosed
    (And.intro E.dimensionPosClosed
      (And.intro E.redundancyNonnegClosed
        (And.intro E.capacityNonnegClosed E.capacityLeOneClosed)))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse