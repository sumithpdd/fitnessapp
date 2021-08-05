import 'package:fitnessapp/models/exercise.dart';
import 'package:fitnessapp/models/exercise_group.dart';
import 'package:fitnessapp/models/resource.dart';

final dummyExercises = [
  Exercise(
      exerciseId: 'E1',
      exerciseName: 'Bench press',
      exerciseGroup: 'Chest',
      exerciseImage: Resource.image.benchPress,
      exerciseVideo: '',
      estimatedTime: 60),
  Exercise(
      exerciseId: 'E2',
      exerciseName: 'Dumbbell fly',
      exerciseGroup: '',
      exerciseImage: Resource.image.dumbbellFly,
      exerciseVideo: '',
      estimatedTime: 60),
  Exercise(
      exerciseId: 'E3',
      exerciseName: 'Incline press',
      exerciseGroup: 'Chest',
      exerciseImage: Resource.image.inclinePress,
      exerciseVideo: '',
      estimatedTime: 60),
  Exercise(
      exerciseId: 'E4',
      exerciseName: 'Bench press',
      exerciseGroup: 'Chest',
      exerciseImage: Resource.image.declinePress,
      exerciseVideo: '',
      estimatedTime: 60),
];

final exercises = [
  ExerciseGroup(
    name: "Chest",
    numOfArticle: 16,
    image: Resource.image.chestExercises,
  ),
  ExerciseGroup(
    name: "Back",
    numOfArticle: 16,
    image: Resource.image.backExercises,
  ),
  ExerciseGroup(
    name: "Biceps",
    numOfArticle: 16,
    image: Resource.image.bicepsExercises,
  ),
  ExerciseGroup(
    name: "Triceps",
    numOfArticle: 16,
    image: Resource.image.tricepsExercises,
  ),
  ExerciseGroup(
    name: "Shoulders",
    numOfArticle: 16,
    image: Resource.image.shoulderExercises,
  ),
  ExerciseGroup(
    name: "Abs",
    numOfArticle: 16,
    image: Resource.image.absExercises,
  ),
  ExerciseGroup(
    name: "Leg",
    numOfArticle: 16,
    image: Resource.image.legExercises,
  ),
  ExerciseGroup(
    name: "Neck",
    numOfArticle: 16,
    image: Resource.image.neckExercises,
  ),
];
