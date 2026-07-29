import canonicalLaneMathlib.AdmissibleClass
import BurstCorrectingCodesLemmaCanonicalLaneLean.BurstCodesAdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure CyclicBurstPackage where
  generatorPolynomial : Type
  codewordLength : Nat
  burstCorrectionCapability : Nat
  generatorInducesCyclicCode : Prop
  burstDetectionProperty : Prop

structure CyclicBurstEvidence (C : CyclicBurstPackage) where
  generatorInducesCyclicCodeClosed : C.generatorInducesCyclicCode
  burstDetectionPropertyClosed : C.burstDetectionProperty
  burstCorrectionCapabilityPositive : C.burstCorrectionCapability > 0

def CyclicBurstClosed (C : CyclicBurstPackage) : Prop :=
  C.generatorInducesCyclicCode ∧ C.burstDetectionProperty ∧ C.burstCorrectionCapability > 0

theorem cyclic_burst_closed_from_evidence
    (C : CyclicBurstPackage) (Ev : CyclicBurstEvidence C) : CyclicBurstClosed C := by
  exact And.intro Ev.generatorInducesCyclicCodeClosed
    (And.intro Ev.burstDetectionPropertyClosed Ev.burstCorrectionCapabilityPositive)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse