package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.MyCard;

public class FlashcardValidator {
    // バリデーションを実行する
    public static List<String> validate(MyCard my) {
        List<String> errors = new ArrayList<String>();

        String word_error = validateWord(my.getWord());
        if(!word_error.equals("")) {
            errors.add(word_error);
        }

        String mean_error = validateMean(my.getMean());
        if(!mean_error.equals("")) {
            errors.add(mean_error);
        }

        String type_error = validateType(my.getType());
        if(!type_error.equals("")) {
            errors.add(type_error);
        }

        String understand_error = validateUnderstand(my.getUnderstand().toString());
        if(!understand_error.equals("")) {
            errors.add(understand_error);
        }

        return errors;
    }

    // 単語名の必須入力チェック
    private static String validateWord(String word) {
        if(word == null || word.equals("")) {
            return "単語名を入力してください。";
        }

        return "";
    }

    // 意味の必須入力チェック
    private static String validateMean(String mean) {
        if(mean == null || mean.equals("")) {
            return "意味を入力してください。";
        }

        return "";
    }

 // ジャンルの必須入力チェック
    private static String validateType(String type) {
        if(type == null || type.equals("")) {
            return "ジャンルを選択してください。";
        }

        return "";
    }

 // 理解度の必須入力チェック
 private static String validateUnderstand(String understand) {
     if(understand == null || understand.equals("")) {
         return "理解度を選択してください。";
     }

     return "";
 }

}