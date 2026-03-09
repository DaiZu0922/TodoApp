package todo.model;

import java.time.LocalDate;

/**
 * Todoデータを管理するモデルクラス
 */
public class Todo {

    // タスク名
    private String title;

    // 完了状態
    private boolean completed;

    // 期限日
    private LocalDate deadline;

    /**
     * コンストラクタ
     * @param title タスク名
     * @param deadline 期限日
     */
    public Todo(String title, LocalDate deadline) {
        this.title = title;
        this.completed = false;
        this.deadline = deadline;
    }

    /**
     * タイトル取得
     */
    public String getTitle() {
        return title;
    }

    /**
     * 完了状態取得
     */
    public boolean isCompleted() {
        return completed;
    }

    /**
     * 完了状態切替
     */
    public void toggleCompleted() {
        this.completed = !this.completed;
    }

    /**
     * 期限取得
     */
    public LocalDate getDeadline() {
        return deadline;
    }

    /**
     * 期限変更（必要なら使用）
     */
    public void setDeadline(LocalDate deadline) {
        this.deadline = deadline;
    }

}