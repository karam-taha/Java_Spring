package com.axsos.Lookify.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.Lookify.Models.Song;
import com.axsos.Lookify.Repositories.SongRepository;

@Service
public class SongService {
	@Autowired
	SongRepository songRepository;
	
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	public List<Song> allSongs(){
		return songRepository.findAll();
	}
	
	public Song addSong(Song song) {
		return songRepository.save(song);
	}
	
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		}else {
			return null;
		}
	}
	
	public List<Song> findByArtist(String artist) {
		return songRepository.findByArtistContaining(artist);
	}
	
	public List<Song> findByTitle(String title) {
		return songRepository.findByTitleContaining(title);
	}
	
	public List<Song> topTen() {
		return songRepository.getTopTen();
	}
	
	public Song updateSong(Song song) {
		return songRepository.save(song);
	}
	
	public void deleteSong(Song song) {
		songRepository.delete(song);
	}
}
