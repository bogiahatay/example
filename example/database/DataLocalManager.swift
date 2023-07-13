//
//  DataLocalManager.swift
//  example
//
//  Created by Hà on 07/07/2023.
//

import Foundation
import ObjectMapper


public class DataLocalManager {

    static let PREF_LIST_EXERCISE_DD = "PREF_LIST_EXERCISE_DD"
    static let PREF_LIST_EXERCISE_TICK = "PREF_LIST_EXERCISE_TICK"
    static let KEY_LESSON = "KEY_LESSON"
    static let PREF_CONFIG = "PREF_CONFIG"
    static let PREF_MYCLASS = "PREF_MYCLASS"

    static var instance: DataLocalManager? = nil

//    public MySharedPreferences mySharedPreferences;
//
//    public static void init(Context context) {
//        instance = new DataLocalManager();
//        instance.mySharedPreferences = new MySharedPreferences(context);
//    }

    static func getInstance() -> DataLocalManager {
        if (instance == nil) {
            instance = DataLocalManager()
        }
        return instance!
    }

    static func  addListExerciseDD() {
//
//        let listExercise:Array<ExerciseModel>  = getListExerciseDD()
//
//        for (int i = 0; i < listExercise.size; i + +) {
//            if (listExercise.get(i).getLinkExercise() == model.getLinkExercise())) {
//                listExercise.remove(at: i)
//            }
//        }
//        listExercise.add(0, model)
//        if (listExercise.size > 100) {
//            listExercise.remove(at: listExercise.size() - 1)
//        }
//        let jsonListExercise = listExercise.toJson()
        MySharedPreferences.putStringValue(PREF_LIST_EXERCISE_DD, "acb")
    }

//    static func  getListExerciseDD() -> Array<ExerciseModel>{
//        let jsonListExercise = DataLocalManager.getInstance().getStringValue(PREF_LIST_EXERCISE_DD)
//        if (jsonListExercise.isEmpty) {
//            let listExercise: Array<ExerciseModel> = []
//            return listExercise
//        } else {
//            return Mapper<ExerciseModel>().mapArray(JSONString: jsonListExercise)!
//        }
//    }
//



//    public static void addListExerciseTick(ExerciseModel model) {
//
//        ArrayList<ExerciseModel> listExercise = getListExerciseTick()
//        for (int i = 0; i < listExercise.size(); i + +) {
//            if (listExercise.get(i).getLinkExercise().equals(model.getLinkExercise())) {
//                listExercise.remove(i)
//            }
//        }
//        listExercise.add(0, model)
//        if (listExercise.size() > 100) {
//            listExercise.remove(listExercise.size() - 1)
//        }
//        String jsonListExercise = new Gson().toJson(listExercise)
//        DataLocalManager.getInstance().mySharedPreferences.putStringValue(PREF_LIST_EXERCISE_TICK, jsonListExercise)
//    }
//
//    public static ArrayList<ExerciseModel> getListExerciseTick() {
//        String jsonListExercise = DataLocalManager.getInstance().mySharedPreferences.getStringValue(PREF_LIST_EXERCISE_TICK)
//        if (jsonListExercise.isEmpty()) {
//            ArrayList<ExerciseModel> listExercise = new ArrayList<>()
//            return listExercise
//        } else {
//            return new Gson().fromJson(jsonListExercise,
//                                       new TypeToken<ArrayList<ExerciseModel>>() {
//                                       }.getType())
//        }
//    }
//
//    public static void removeListExerciseTick(ExerciseModel model) {
//        List<ExerciseModel> listExercise = getListExerciseTick()
//        for (int i = 0; i < listExercise.size(); i + +) {
//            if (listExercise.get(i).getLinkExercise().equals(model.getLinkExercise())) {
//                listExercise.remove(i)
//                break
//            }
//        }
//        String jsonListExercise = new Gson().toJson(listExercise)
//        DataLocalManager.getInstance().mySharedPreferences.putStringValue(PREF_LIST_EXERCISE_TICK, jsonListExercise)
//    }
//
//    public static List<ExerciseModel> getDatabase(ExerciseModel model) {
//        List<ExerciseModel> listExercise = getListExerciseTick()
//        for (int i = 0; i < listExercise.size(); i + +) {
//            if (listExercise.get(i).getLinkExercise().equals(model.getLinkExercise())) {
//                return listExercise
//            }
//
//        }
//        String jsonListExercisey = new Gson().toJson(listExercise)
//        DataLocalManager.getInstance().mySharedPreferences.putStringValue(PREF_LIST_EXERCISE_TICK, jsonListExercisey)
//        return null
//    }
//
//    public static void addConfig(ConfigResponse configResponse) {
//        String jsonConfig = new Gson().toJson(configResponse)
//        DataLocalManager.getInstance().mySharedPreferences.putStringValue(PREF_CONFIG + BuildConfig.VERSION_CODE, jsonConfig)
//    }
//
//    public static ConfigResponse getConfig() {
//        String jsonConfig = DataLocalManager.getInstance().mySharedPreferences.getStringValue(PREF_CONFIG + BuildConfig.VERSION_CODE)
//        return new Gson().fromJson(jsonConfig, ConfigResponse.class)
//    }
//
//    public static void addDateRate(String key, boolean b) {
//        DataLocalManager.getInstance().mySharedPreferences.putBooleanValue(key, true)
//    }
//
//    public static boolean getDateRate(String key, boolean b) {
//        return DataLocalManager.getInstance().mySharedPreferences.getBooleanValue(key)
//    }
//
//
//    public static void addClickMyClass(MyClassModel myClassModel) {
//        String jsonMyClass = new Gson().toJson(myClassModel)
//        DataLocalManager.getInstance().mySharedPreferences.putStringValue(PREF_MYCLASS, jsonMyClass)
//
//    }
//    public static MyClassModel getClickMyClass() {
//        String jsonMyClass = DataLocalManager.getInstance().mySharedPreferences.getStringValue(PREF_MYCLASS)
//        return new Gson().fromJson(jsonMyClass, MyClassModel.class)
//    }

}
