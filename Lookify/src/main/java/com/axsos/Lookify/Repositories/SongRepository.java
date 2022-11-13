package com.axsos.Lookify.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.axsos.Lookify.Models.Song;

public interface SongRepository extends CrudRepository<Song, Long>{
	List<Song> findAll();
	
	List<Song> findByArtistContaining(String artist);
	List<Song> findByTitleContaining(String title);
	
	List<Song> findAllByOrderByRatingDesc();
	List<Song> findTopByOrderByRatingDesc();
	
	@Query(value = "SELECT * FROM songs ORDER BY rating DESC LIMIT 10", nativeQuery = true) 
	List<Song> getTopTen();

}
