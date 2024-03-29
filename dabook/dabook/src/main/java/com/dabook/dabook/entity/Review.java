package com.dabook.dabook.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;

import static jakarta.persistence.FetchType.LAZY;

@Entity
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Review {

    @Id @GeneratedValue
    @Column(name = "review_no")
    private Long no;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "book_no", nullable = false)
    private Book books;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "user_no",nullable = false)
    private User users;

    private String reviewContent;

    @CreatedDate
    @Column(nullable = false, updatable = false)
    @Builder.Default
    private LocalDateTime reviewDate = LocalDateTime.now();

    private int rating; // 별점

    public Review(User user, Book book,String reviewContent,int rating) {
        this.users=user;
        this.books=book;
        this.rating=rating;
        this.reviewContent=reviewContent;
    }


    public static Review saveReview(User user, Book book,String reviewContent,int rating ){
        return new Review(user,book,reviewContent,rating);
    }

}