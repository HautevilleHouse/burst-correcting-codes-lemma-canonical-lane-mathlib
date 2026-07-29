import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.BurstModel

/-!
# Burst Error Control Package
-/

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorControlPackage {C : CommunicationChannel} {B : BurstModel C} {R : CodeConstruction B} {E : ErrorProfile R} where
  codeFamily : Type u
  encodingProcedure : Prop
  decodingProcedure : Prop
  burstCorrectionCapability : Prop
  syndromeUniqueness : Prop
  polynomialStructure : Prop

structure BurstErrorControlEvidence {C : CommunicationChannel} {B : BurstModel C} {R : CodeConstruction B} {E : ErrorProfile R} (P : BurstErrorControlPackage C B R E) where
  encodingProcedureClosed : P.encodingProcedure
  decodingProcedureClosed : P.decodingProcedure
  burstCorrectionCapabilityClosed : P.burstCorrectionCapability
  syndromeUniquenessClosed : P.syndromeUniqueness
  polynomialStructureClosed : P.polynomialStructure

def BurstErrorControlClosed {C : CommunicationChannel} {B : BurstModel C} {R : CodeConstruction B} {E : ErrorProfile R} (P : BurstErrorControlPackage C B R E) : Prop :=
  P.encodingProcedure ∧ P.decodingProcedure ∧
  P.burstCorrectionCapability ∧ P.syndromeUniqueness ∧
  P.polynomialStructure

theorem burst_error_control_closed_from_evidence {C : CommunicationChannel} {B : BurstModel C} {R : CodeConstruction B} {E : ErrorProfile R}
  (P : BurstErrorControlPackage C B R E) (Ev : BurstErrorControlEvidence P) : BurstErrorControlClosed P := by
  exact And.intro Ev.encodingProcedureClosed
    (And.intro Ev.decodingProcedureClosed
      (And.intro Ev.burstCorrectionCapabilityClosed
        (And.intro Ev.syndromeUniquenessClosed
          Ev.polynomialStructureClosed)))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse