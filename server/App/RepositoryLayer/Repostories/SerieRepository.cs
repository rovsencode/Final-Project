﻿using DomainLayer.Entites;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;

namespace RepositoryLayer.Repostories
{
    public class SerieRepository : Repository<Serie>, ISerieRepository
    {
        private readonly IActressRepository _repo;
        private readonly AppDbContext _appDbContext;
        public SerieRepository(AppDbContext appDbContext, IActressRepository repo) : base(appDbContext)
        {
            _repo = repo;
            _appDbContext = appDbContext;

        }

        public async Task CreateMany(Serie serie, List<int> actressIds,List<int> seasonNumbers,List<int> episodes,string epiTitle,DateTime airDate)
        {

            var actresses = await _repo.FindAllByExpression(a => actressIds.Contains(a.Id));

            serie.SerieActress = new();
            foreach (var actress in actresses)
            {
                serie.SerieActress.Add(new SerieActress
                {
                    ActressId = actress.Id,
                    SerieId = serie.Id,
                    isDeleted = false,
                    CreatedTime = DateTime.UtcNow,
                });
            }
          serie.Seasons= new();
            foreach (var number in seasonNumbers)
            {
               
                Season season = new();
                season.SerieId = serie.Id;
                season.SeasonNumber = number;
                serie.Seasons.Add(season);
                await _appDbContext.SaveChangesAsync();
                season.Episodes = new();

                foreach (var epiNum in episodes)
                {
                    for (int i = 0; i <= epiNum; i++)
                    {
                        Episode episode = new();

                        episode.AirDate = airDate;
                        episode.EpisodeTitle = epiTitle;
                        episode.EpisodeNumber = epiNum;
                        episode.SeasonId = season.Id;
                        season.Episodes.Add(episode);
                    }
                }
            }
            await _appDbContext.SaveChangesAsync();

          

        }

 
    }
}
