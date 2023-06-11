package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.User;

public class AccountValidator {
    // バリデーションを実行する
    public static List<String> validate(User user) {
        List<String> errors = new ArrayList<String>();

        String id_error = validateId(user.getId().toString());
        if(!id_error.equals("")) {
            errors.add(id_error);
        }

        String name_error = validateName(user.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String password_error = validatePass(user.getPassword());
        if(!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }

    // ユーザIDの必須入力チェック
    private static String validateId(String id) {
        if(id == null || id.trim().equals("")) {
            return "ユーザーIDを入力してください。";
        }

        return "";
    }

 // ユーザ名の必須入力チェック
    private static String validateName(String name) {
        if(name == null || name.equals("")) {
            return "ユーザー名を入力してください。";
        }

        return "";
    }

    // パスワードの必須入力チェック
    private static String validatePass(String password) {
        if(password == null || password.equals("")) {
            return "パスワードを入力してください。";
        }

        return "";
    }
}