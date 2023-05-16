using AutoMapper;
using DomainLayer.Entites;
using RepositoryLayer.Repostories.Interfaces;
using ServiceLayer.DTOs.SerieDto;
using ServiceLayer.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer.Services
{
    public class SerieService : ISerieService
    {
        private readonly ISerieRepository _repo;
        private readonly IMapper _mapper;

        public SerieService(IMapper mapper, ISerieRepository repo)
        {
            _mapper = mapper;
            _repo = repo;
        }

        public async Task Create(SerieCreateDto serieCreateDto)
        {
            Serie serie = new() {
                Name=serieCreateDto.Name,
                AgeRestriction=serieCreateDto.AgeRestriction,
                Description=serieCreateDto.Description,
                ImageUrl=serieCreateDto.ImageUrl,
                Raiting=serieCreateDto.Raiting,
                Price=serieCreateDto.Price,
                Year=serieCreateDto.Year,
                GenreId=serieCreateDto.GenreId,
            };

            await _repo.Create(serie);
           await _repo.CreateMany(serie, serieCreateDto.actressIds, serieCreateDto.Seasons, serieCreateDto.Episodes, serieCreateDto.EpisodeTitle, serieCreateDto.AirDate,serieCreateDto.qualityIds);

        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Serie>> Filter(int genreId, int qualtyId, int imdbStart, int imdbEnd, DateTime starYear, DateTime endYear)
        {
            //int qualtyId,
        var series= await   _repo.FindAllByExpression(s => s.GenreId == genreId && s.Raiting>=imdbStart && s.Raiting<=imdbEnd && s.Year>=starYear && s.Year<=endYear);
            return (series);
        }

        public Task<List<SerieListDto>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task SoftDelete(int id)
        {
            throw new NotImplementedException();
        }

        public Task Update(int id, SerieUpdateDto serie)
        {
            throw new NotImplementedException();
        }
    }
}
