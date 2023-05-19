package models;

/*
 * mycard(マイページに表示する自分の単語帳テーブル)
 * の必要なデータを格納するクラス
 */
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mycard")
public class MyCard {

    /*
     * 単語カードID
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

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

    /*
     * 更新日時
     */
    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}