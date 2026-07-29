import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCorrectingEndgamePackage where
  codeLength : Nat
  burstLength : Nat
  dimension : Nat
  decodingSuccess : Prop
  capacityAchieved : Prop
  codeLengthPos : codeLength > 0
  burstLengthPos : burstLength > 0
  dimensionPos : dimension > 0

structure BurstCorrectingEndgameEvidence (E : BurstCorrectingEndgamePackage) where
  codeLengthPosClosed : E.codeLengthPos
  burstLengthPosClosed : E.burstLengthPos
  dimensionPosClosed : E.dimensionPos
  decodingSuccessClosed : E.decodingSuccess
  capacityAchievedClosed : E.capacityAchieved

def BurstCorrectingEndgameClosed (E : BurstCorrectingEndgamePackage) : Prop :=
  E.codeLengthPos ∧ E.burstLengthPos ∧ E.dimensionPos ∧ E.decodingSuccess ∧ E.capacityAchieved

theorem burst_correcting_endgame_closed_from_evidence (E : BurstCorrectingEndgamePackage) (Ev : BurstCorrectingEndgameEvidence E) : BurstCorrectingEndgameClosed E := by
  exact And.intro Ev.codeLengthPosClosed
    (And.intro Ev.burstLengthPosClosed
      (And.intro Ev.dimensionPosClosed
        (And.intro Ev.decodingSuccessClosed Ev.capacityAchievedClosed)))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse