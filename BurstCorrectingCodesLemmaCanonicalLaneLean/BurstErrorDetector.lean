import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorDetectorPackage {M : BurstErrorModelPackage} where
  detectionMethod : Type u
  falseAlarmProbability : Prop
  missedDetectionProbability : Prop
  detectionLatency : Nat

structure BurstErrorDetectorEvidence {M : BurstErrorModelPackage} (D : BurstErrorDetectorPackage M) where
  falseAlarmProbabilityClosed : D.falseAlarmProbability < 0.5
  missedDetectionProbabilityClosed : D.missedDetectionProbability < 0.5
  detectionLatencyClosed : D.detectionLatency > 0

def BurstErrorDetectorClosed {M : BurstErrorModelPackage} (D : BurstErrorDetectorPackage M) : Prop :=
  D.falseAlarmProbability < 0.5 ∧ D.missedDetectionProbability < 0.5 ∧ D.detectionLatency > 0

theorem burst_error_detector_closed_from_evidence {M : BurstErrorModelPackage} (D : BurstErrorDetectorPackage M) (E : BurstErrorDetectorEvidence D) :
    BurstErrorDetectorClosed D := by
  exact And.intro E.falseAlarmProbabilityClosed (And.intro E.missedDetectionProbabilityClosed E.detectionLatencyClosed)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse