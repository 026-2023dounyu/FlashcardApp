package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
    @NamedQuery(
            name = "getAllShareCard",
            query = "SELECT share FROM ShareCard AS share ORDER BY share.type, share.word"
            ),
    @NamedQuery(
            name = "getShareCard",
            query = "SELECT share FROM ShareCard AS share WHERE share.name = :name AND share.word = :word AND share.mean = :mean"
            )
})
@Table(name = "sharecard")
public class ShareCard {

    /*
     * 単語カードID
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /*
     * 登録ユーザー
     */
    @Column(name = "name", length = 255, nullable = false)
    private String name;

    /*
     * 単語のジャンル
     */
    @Column(name = "type", length = 255, nullable = false)
    private String type;

    /*
     * 単語名
     */
    @Column(name = "word", length = 255, nullable = false)
    private String word;

    /*
     * 単語の意味
     */
    @Column(name = "mean", length = 255, nullable = false)
    private String mean;

    /*
     * 作成日時
     */
    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getMean() {
        return mean;
    }

    public void setMean(String mean) {
        this.mean = mean;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}