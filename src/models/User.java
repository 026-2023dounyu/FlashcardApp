package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity

/*
 * SQLを書きたいときはここに書く
 * NamedQueryを増やしていけば一杯かける
 *
 * @NamedQueries({
 *  @NamedQuery(
 *      name = "SQL文の名前をつける",
 *      query = "SQL文"
 *  )
 * })
 *
 * SQLを実行したいときは実行結果をListに格納する
 * List<Message> messages = em.createNamedQuery("getAllMessages", Message.class).getResultList();
 *
 */

@NamedQueries({
    @NamedQuery(
        name = "searchSameId",
        query = "SELECT u FROM User AS u WHERE u.id = :id"
        ),
    @NamedQuery(
            name = "searchUser",
            query = "SELECT u FROM User AS u WHERE u.id = :id AND u.password = :password"
            )
})

@Table(name = "user")
public class User {

    //ユーザーID
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    //ユーザー名
    @Column(name = "name", length = 255, nullable = false)
    private String name;

    //パスワード
    @Column(name = "password", length = 255, nullable = false)
    private String password;

    //ログイン状況(ログイン：1, ログアウト：0)
    @Column(name = "login", nullable = false)
    private Integer login;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getLogin() {
        return login;
    }

    public void setLogin(Integer login) {
        this.login = login;
    }

}