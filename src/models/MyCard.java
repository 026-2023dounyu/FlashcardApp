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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
    @NamedQuery(
            name = "getAllMyCard",
            query = "SELECT my FROM MyCard AS my ORDER BY my.word "
            ),
    @NamedQuery(
            name = "getItCard",
            query = "SELECT my FROM MyCard AS my WHERE my.understand < 2 AND my.type='IT'"
            ),
    @NamedQuery(
            name = "getInsuranceCard",
            query = "SELECT my FROM MyCard AS my WHERE my.understand < 2 AND my.type='保険'"
            ),
    @NamedQuery(
            name = "getBusinessCard",
            query = "SELECT my FROM MyCard AS my WHERE my.understand < 2 AND my.type='ビジネス'"
            ),
    @NamedQuery(
            name = "getOthersCard",
            query = "SELECT my FROM MyCard AS my WHERE my.understand < 2 AND my.type='その他'"          )
})
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

    /*
     * 理解度(×：0, △：1, 〇：2)
     */
    @Column(name = "understand", nullable = false)
    private Integer understand;

    /*
     * 共有するかどうか
     * しない→0、する→1
     */
    @Column(name = "share" , nullable = false)
    private Integer share;

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

    public Integer getUnderstand() {
        return understand;
    }

    public void setUnderstand(Integer understand) {
        this.understand = understand;
    }

    public Integer getShare() {
        return share;
    }

    public void setShare(Integer share) {
        this.share = share;
    }
}